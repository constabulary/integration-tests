#!/bin/bash
set -e

cd "$(dirname "$BASH_SOURCE")"

for script in */run.bash; do
	pushd "$(dirname "$script")"
	echo
	echo "Running '$(basename "$PWD")' integration test ..."
	echo
	[ -x setup.bash ] && ./setup.bash
	./run.bash
	popd
done
