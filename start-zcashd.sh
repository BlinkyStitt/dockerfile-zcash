#!/bin/sh
# setup config, fetch params, and start the zcash daemon
#
# this runs from inside the container. don't run this on the host

# mounting the config inside another mount did weird things
cp /config/zcash.conf ~/.zcash/

# TODO: customize the config with -proxy or other things that can't handle DNS

# TODO: lock to make sure multiple containers aren't fetching at the same time?
zcash-fetch-params || exit 1

exec zcashd -printtoconsole "$@"
