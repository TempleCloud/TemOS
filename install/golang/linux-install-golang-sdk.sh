#!/bin/bash

# https://golang.org/doc/install
# https://golang.org/doc/install#install
# https://golang.org/dl/

function install() {
    # local version="1.10.2"
    local version="1.12.4"
    local binary="go${version}.linux-amd64.tar.gz"
    # local expected_sha256="4b677d698c65370afa33757b6954ade60347aaca310ea92a63ed717d7cb0c2ff"
    local expected_sha256="d7d1f1f88ddfe55840712dc1747f37a790cbcaa448f6c9cf51bbe10aa65442f5"

    if [ ! -f "${binary}" ]; then
        curl -O https://dl.google.com/go/"${binary}"
    fi

    local sha256=$(sha256sum "${binary}" | awk '{print $1}')
    if [[ "${sha256}" != "${expected_sha256}" ]]; then
        echo "${binary} hash mismatch: ${sha256}"
        exit 1
    fi

    tar xvf "${binary}"
    local install_dir="/usr/local"
    sudo chown -R root:root ./go
    sudo mv go "${install_dir}"

    # Remember to update profile!
    #
    # export GOROOT=/usr/local/go
    # export GOPATH=$HOME/work
    # export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
    # export PATH=$PATH:/usr/local/go/bin

    rm -Rf "${binary}"
} && install

