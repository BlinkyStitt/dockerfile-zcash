#!/bin/sh
# setup config, fetch params, and start the zcash daemon
#
# this runs from inside the container. don't run this on the host


#!/bin/bash
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

    # TODO: customize the config with -proxy or other things that can't handle DNS

    # TODO: lock to make sure multiple containers aren't fetching at the same time?
    zcash-fetch-params || exit 1

    exec "$@"
fi

# otherwise, don't get in their way
exec "$@"
