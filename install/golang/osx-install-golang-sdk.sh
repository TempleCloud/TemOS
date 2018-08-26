#!/bin/bash

# https://golang.org/doc/install
# https://golang.org/dl/


function install() {
    local version="1.10.3"
    local binary="go${version}.darwin-amd64.tar.gz"
    local expected_sha256="131fd430350a3134d352ee75c5ca456cdf4443e492d0527a9651c7c04e2b458d"

    if [ ! -f "${binary}" ]; then
        curl -O https://dl.google.com/go/"${binary}"
    fi

    local sha256=$(openssl sha256 "${binary}" | awk '{print $2}')
    if [[ "${sha256}" != "${expected_sha256}" ]]; then
        echo "${binary} hash mismatch: ${sha256}"
        exit 1
    fi

    tar xvf "${binary}"
    local install_dir="/usr/local"
    sudo chown -R root:admin ./go
    sudo mv go "${install_dir}"

    # Remember to update profile!
    #
    # export GOROOT=/usr/local/go
    # export GOPATH=$HOME/work
    # export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

    rm -Rf "${binary}"
} && install

