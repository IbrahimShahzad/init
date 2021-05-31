#!/bin/bash
pushd /opt/
tar xf dpdk-20.11.1.tar.xz
pushd dpdk-stable-20.11.1
pip3 install meson ninja
meson build
pushd build
ninja
nija install
ldconfig
popd
popd
popd
modprobe uio
