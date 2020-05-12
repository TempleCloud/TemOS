#!/bin/bash
set -e

# References
#
# https://www.digitalocean.com
# https://www.digitalocean.com/docs/apis-clis/doctl/how-to/install

function install() {
    local version="1.43.0"
    wget https://github.com/digitalocean/doctl/releases/download/v${version}/doctl-${version}-linux-amd64.tar.gz

    tar xf doctl-${version}-linux-amd64.tar.gz
    mv doctl "${TEMOS_BIN}"

    rm -f doctl-${version}-linux-amd64.tar.gz
} && install