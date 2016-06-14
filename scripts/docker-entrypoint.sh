#!/bin/dumb-init /bin/sh
set -e

if [ -n "$USE_BUNDLE_EXEC" ]; then
  BINARY="bundle exec node_heartbeat"
else
  BINARY=node_heartbeat
fi

if ${BINARY} help "$1" 2>&1 | grep -q "node_heartbeat $1"; then
  set -- gosu heartbeat ${BINARY} "$@"
fi

exec "$@"
