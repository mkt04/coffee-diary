#!/bin/bash
set -e

rm -f /coffee-diary/tmp/pids/server.pid

exec "$@"