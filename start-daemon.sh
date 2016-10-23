#!/bin/sh

# TODO: lock to make sure multiple containers aren't fetching at the same time?
zcash-fetch-params

exec zcashd -conf=/config/zcash.conf -printtoconsole "$@"
