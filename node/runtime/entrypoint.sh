#!/bin/bash

if [ ! -z "$IOJS_VERSION" ]; then
  nodester u -f $IOJS_VERSION
fi

set -e

if [ "$1" = "run" ]; then
  shift
  run_app $@
else
  exec "$@"
fi