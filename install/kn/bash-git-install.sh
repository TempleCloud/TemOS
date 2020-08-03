#!/bin/bash
set -e

# References
#
# https://istio.io/latest/


function install() {
    pushd $TEMOS_LIB
    mkdir knative
    cd knative
    git clone https://github.com/knative/client.git
    cd client/
    hack/build.sh -f
    rm -f $TEMOS_BIN/kn
    ln -s $TEMOS_LIB/knative/client/kn $TEMOS_BIN
    popd
    kn version

} && install