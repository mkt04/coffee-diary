#!/bin/bash
set -e

rm -f /coffee-dialy/tmp/pids/server.pid

exec "$@"