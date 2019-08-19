#!/bin/bash

# https://github.com/linuxkit/linuxkit
# https://collabnix.com/top-10-reasons-why-linuxkit-is-better-than-the-traditional-os-distribution/

function install() {
    git clone git@github.com:linuxkit/linuxkit.git
    pushd linuxkit
    # NB: Builds in a docker container. Requires GNU make, docker, qeumu.
    make
    cp ./bin/linuxkit ${TEMOS_BIN}/linuxkit
    popd
    rm -Rf linuxkit
} && install
