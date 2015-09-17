#!/bin/bash
set -ex

mkdir -p src
gb vendor -v restore
cd vendor
gb build
gb test
