#!/bin/bash
set -e

cd "$(dirname "$BASH_SOURCE")"

for script in */run.bash; do
	(
	cd "$(dirname "$script")"
	echo
	echo "Running '$(basename "$PWD")' integration test ..."
	echo
	if [ -x setup.bash ]; then
		source ./setup.bash
	fi
	./run.bash
	)
done
