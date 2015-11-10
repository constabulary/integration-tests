#!/bin/bash
set -ex

sudo apt-get install make pkg-config -y

prefix="$PWD/build-prefix"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/lib/pkgconfig"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}$prefix/lib"

wget https://www.libsdl.org/release/SDL2-2.0.3.tar.gz
wget https://www.libsdl.org/release/SDL2-2.0.3.tar.gz.sig
gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 1528635D8053A57F77D1E08630A59377A7763BE6 # http://slouken.libsdl.org/slouken-pubkey.asc
gpg --verify SDL2-2.0.3.tar.gz.sig SDL2-2.0.3.tar.gz
tar zxf SDL2-2.0.3.tar.gz
pushd SDL2-2.0.3
mkdir build
pushd build
../configure --prefix "$prefix"
make
make install
popd
popd
