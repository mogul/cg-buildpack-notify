#!/bin/bash

set -ex

export GOPATH=$(pwd)/gopath
export PATH=$PATH:$GOPATH/bin
mkdir -p ${GOPATH}/bin

export IN_STATE="$(pwd)/${IN_STATE}"
export OUT_STATE="$(pwd)/${OUT_STATE}"

curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

pushd gopath/src/github.com/18F/cg-buildpack-notify
  dep ensure
  go build
  ./cg-buildpack-notify
popd
