#!/bin/bash
set -e

# References
#
# https://cfssl.org/
# https://github.com/cloudflare/cfssl
# https://pkg.cfssl.org/

function install() {
    pushd "${TEMOS_BIN}"
    local version="R1.2"
    curl -o cfssl https://pkg.cfssl.org/"${version}"/cfssl_darwin-amd64
    curl -o cfssljson https://pkg.cfssl.org/"${version}"/cfssljson_darwin-amd64
    chmod +x cfssl cfssljson
    # Alternatively install locally...
    # sudo mv cfssl cfssljson /usr/local/bin/
    popd
} && install