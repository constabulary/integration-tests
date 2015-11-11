#!/bin/bash
set -ex

mkdir -p src
env DEBUG=. gb vendor restore
cd vendor
gb build
gb test
