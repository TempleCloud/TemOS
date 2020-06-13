#!/bin/bash

# kind - Kubernetes in Docker - locahost Kubernetes Cluster
#
# https://kind.sigs.k8s.io/docs/user/quick-start/

function install() {
    curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.8.1/kind-$(uname)-amd64
    chmod +x ./kind
    mv ./kind ${TEMOS_BIN}
} && install

