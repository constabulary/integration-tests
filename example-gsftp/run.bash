#!/bin/bash
set -e

git clone https://github.com/constabulary/example-gsftp.git pkg
cd pkg
gb build
