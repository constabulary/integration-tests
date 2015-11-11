#!/bin/bash
set -ex

# setup steps taken from https://github.com/zeromq/goczmq

sudo apt-get install build-essential gcc make pkg-config -y

prefix="$PWD/build-prefix"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+$PKG_CONFIG_PATH:}$prefix/lib/pkgconfig"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}$prefix/lib"

wget https://download.libsodium.org/libsodium/releases/libsodium-1.0.3.tar.gz
wget https://download.libsodium.org/libsodium/releases/libsodium-1.0.3.tar.gz.sig
#wget https://download.libsodium.org/jedi.gpg.asc
#gpg --import jedi.gpg.asc
gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 54A2B8892CC3D6A597B92B6C210627AABA709FE1 # jedi.gpg.asc
gpg --verify libsodium-1.0.3.tar.gz.sig libsodium-1.0.3.tar.gz
tar zxf libsodium-1.0.3.tar.gz
pushd libsodium-1.0.3
./configure --prefix "$prefix"
#make check
make install
#ldconfig
popd

wget http://download.zeromq.org/zeromq-4.1.1.tar.gz
tar zxf zeromq-4.1.1.tar.gz
pushd zeromq-4.1.1
./configure --prefix "$prefix" --with-libsodium
make
#make check
make install
#ldconfig
popd

wget http://download.zeromq.org/czmq-3.0.1.tar.gz
tar zxf czmq-3.0.1.tar.gz
pushd czmq-3.0.1
./configure --prefix "$prefix"; #make check
make install
#ldconfig
popd
