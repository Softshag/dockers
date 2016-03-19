#!/bin/bash

set -e

if [ "$1" = "run" ]; then
  shift
  run_app $@
else
  exec "$@"
fi