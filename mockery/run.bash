#!/bin/bash
set -ex

if (~/go1.4/bin/go version 2>&1 | grep -o "go1.4") ; then
	exit 0
fi

gb vendor fetch github.com/vektra/mockery
install -d src/github.com/vektra/mockery/cmd/mockery
install vendor/src/github.com/vektra/mockery/cmd/mockery/mockery.go src/github.com/vektra/mockery/cmd/mockery 
gb build
