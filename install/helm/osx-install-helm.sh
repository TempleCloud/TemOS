#!/bin/bash

# Install Helm.
#
# https://helm.sh/
# https://github.com/helm/helm
# 
# https://docs.helm.sh/using_helm/#installing-helm
# https://github.com/helm/helm/releases

function install() {
    # local version="v2.9.1"
    local version="v2.10.0"
    local binary="helm-${version}-darwin-amd64.tar.gz"
    local expected_sha256=$(curl -s https://storage.googleapis.com/kubernetes-helm/${binary}.sha256)   

    if [ ! -f "${binary}" ]; then
        curl -O https://storage.googleapis.com/kubernetes-helm/"${binary}"
    fi

    local sha256=$(openssl sha256 "${binary}" | awk '{print $2}')
    if [[ "${sha256}" != "${expected_sha256}" ]]; then
        echo "${binary} hash mismatch: ${sha256}"
        exit 1
    fi

    tar xvf "${binary}"
    local install_dir="/usr/local/bin/"
    sudo mv darwin-amd64/helm "${install_dir}"

    rm -Rf darwin-amd64 
    rm -f "${binary}"
} && install