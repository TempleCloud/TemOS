#!/bin/bash

# Install Memoria.
#

function install() {
    local target="${HOME}"/Work
    mkdir -p "${target}"
    pushd "${target}" 2>/de/null
    git clone git@github.com:templecloud/memoria.git
    popd
    pushd "${target}/themes" 2>/de/null 
    ./install-themes.sh
    popd
} && install
