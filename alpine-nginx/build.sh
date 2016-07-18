#!/bin/sh


#if [ ! -d ${PWD}/tmp ]; then
#	mkdir ./tmp
#fi

#if [  ! -d runtime ]; then
#	mkdir ${PWD}/runtime
#fi
if [ ! -f runtime/confd ]; then
	mkdir tmp
	docker run --rm -ti -v "$PWD"/tmp:/usr/src/myapp -w /usr/src/myapp  -e GOPATH=/usr/src/myapp builder/golang go  get -x github.com/kelseyhightower/confd 

	cp ${PWD}/tmp/bin/confd ${PWD}/runtime
	sudo rm -rf ${PWD}/tmp
fi 

docker build --tag softshag/alpine-nginx-confd .