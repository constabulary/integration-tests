#!/bin/bash
set -ex

gb vendor fetch github.com/vektra/mockery
install -d src/github.com/vektra/mockery/cmd/mockery
install vendor/src/github.com/vektra/mockery/cmd/mockery/mockery.go src/github.com/vektra/mockery/cmd/mockery 
gb build
