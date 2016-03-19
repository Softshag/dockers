#!/bin/bash

BUILDDIR=$PWD/build
RUNTIME=$PWD/runtime

if [ ! -d "$BUILDDIR" ]; then
  mkdir $BUILDDIR
fi

if [ -d "$RUNTIME" ]; then
  rm -r $RUNTIME
fi

if [ ! -d "$BUILDDIR/go" ]; then
  mkdir -p $BUILDDIR/go

  cd $BUILDDIR/go
  curl -L# https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz | tar zx --strip 1

fi

cd $BUILDDIR/go/src && ./make.bash

mkdir $RUNTIME

export GOBIN="$BUILDDIR/go/bin"
export GOROOT="$BUILDDIR/go"

export GOPATH="$BUILDDIR/nodester/Godeps/_workspace"
mkdir -p $BUILDDIR/nodester
cd $BUILDDIR/nodester
curl -L# https://github.com/kildevaeld/nodester/archive/master.tar.gz | tar zx --strip 1
$GOBIN/go build -o $RUNTIME/nodester *.go


export GOPATH="$BUILDDIR/keepon/Godeps/_workspace"
mkdir -p $BUILDDIR/keepon
cd $BUILDDIR/keepon
curl -L# https://github.com/kildevaeld/keepon/archive/master.tar.gz | tar zx --strip 1
$GOBIN/go build -o $RUNTIME/keepon *.go

cd $RUNTIME
curl -L# https://godeb.s3.amazonaws.com/godeb-amd64.tar.gz | tar zx --strip 1

