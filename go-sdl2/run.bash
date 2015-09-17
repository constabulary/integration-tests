#!/bin/bash
set -ex

gb vendor -v restore
gb build
