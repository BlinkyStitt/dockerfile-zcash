#!/bin/bash
# setup config, fetch params, and start the zcash daemon
#
# this runs from inside the container. don't run this on the host
set -e

# this if will check if the first argument is a flag
# but only works if all arguments require a hyphenated flag
# -v; -SL; -f arg; etc will work, but not arg1 arg2
if [ "${1:0:1}" = '-' ]; then
    set -- zcashd "$@"
fi

# check for the expected command
if [ "$1" = 'zcashd' ]; then
    # mounting the config inside another mount did weird things
    # we copy instead of symlink so that we can add things like proxy options
    # we don't just add --config to the exec because we always forget that when attaching
    cp /config/zcash.conf ~/.zcash/

    # customize the config with -proxy or other things that can't handle DNS
    # zcashd does not support name resolution for the proxy setting so we get the IP for the Tor container
    if [ -n "$TOR_HOSTNAME" ]; then
        until [ -n "$TOR_IP" ]; do
            TOR_IP=$(getent hosts "$TOR_HOSTNAME" | cut -f1 -d' ')

            # TODO: max wait?
            if [ -z "$TOR_IP" ]; then
                echo "Tor is not yet running at $TOR_HOSTNAME! Sleeping..."
                sleep 10
            fi
        done

        # proxy or onion
        [ -z "$TOR_OPTION" ] && TOR_OPTION="proxy"

        # TODO: allow onion option instead of proxy
        echo "${TOR_OPTION}=${TOR_IP}:9050" >> ~/.zcash/zcash.conf

        # TODO: get the hidden service address
    fi

    # TODO: lock to make sure multiple containers aren't fetching at the same time?
    zcash-fetch-params || exit 1

    exec "$@" -printtoconsole
fi

# otherwise, don't get in their way
exec "$@"
