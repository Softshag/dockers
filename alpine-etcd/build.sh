#!/bin/sh

if [ ! -f "runtime/etcd" ]; then
	#git clone https://github.com/coreos/etcd.git etcd
	#cd etcd
	#git checkout release-2.3
	#cd ..

	#docker run --rm -ti -v "$PWD"/etcd:/usr/src/myapp -w /usr/src/myapp builder/golang sh build
	#cp etcd/bin/* runtime
	#rm -r etcd
	mkdir tmp
	docker run --rm -v ${PWD}/tmp:/var/src/build -e GOPATH=/var/src/build  builder/golang go get github.com/coreos/etcd
	docker run --rm -v ${PWD}/tmp:/var/src/build -e GOPATH=/var/src/build  builder/golang go get github.com/coreos/etcd/etcdctl

	cp tmp/bin/* runtime
	rm -rf tmp
fi


docker build --tag softshag/alpine-etcd .