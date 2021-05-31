#!/bin/bash
pushd /opt/
git clone http://dpdk.org/git/apps/pktgen-dpdk
pushd pktgen-dpdk
make
popd

