#!/bin/sh

set -e

if [ "$1" = 'etcdctl' ]; then
    shift 
    exec  /usr/bin/etcdctl "$@"
else
    exec /usr/bin/etcd "$@"	
fi


