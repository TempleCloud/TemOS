#!/bin/bash
set -e

# References
#
# https://istio.io/latest/
# https://istio.io/latest/docs/setup/install/istioctl/
# https://istio.io/latest/docs/setup/getting-started/#download

function install() {
    local version="istio-1.6.7"
    curl -sL https://istio.io/downloadIstio | sh -
    mv ${version} $TEMOS_LIB
    ln -s $TEMOS_LIB/${version}/bin/istioctl $TEMOS_BIN

} && install