#!/bin/bash
set -ex

if (go version 2>&1 | grep -o "devel") ; then
	exit 0
fi

mkdir -p src
env DEBUG=. gb vendor restore
cd vendor
gb build
gb test
