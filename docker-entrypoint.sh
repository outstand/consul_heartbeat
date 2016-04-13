#!/bin/dumb-init /bin/sh
set -e

if [ "$(id -u)" = '0' ] && [ "$1" != 'ash' ]; then
  exec gosu heartbeat consul_heartbeat "$@"
fi

exec "$@"
