#!/bin/bash
set -e

# References
#
# https://www.terraform.io/
# https://www.terraform.io/intro/getting-started/install.html
# https://www.terraform.io/downloads.html

function install() {
    local version="0.11.8"
    local url="https://releases.hashicorp.com/terraform/${version}"
    local binary="terraform_${version}_darwin_amd64.zip"

    if [ ! -f "${binary}" ]; then
        curl -O "${url}/${binary}"
    fi

    # local expected_sha256=$(curl -s ${url}/terraform_0.11.8_SHA256SUMS | grep ${binary} | awk '{print $1}')
    # local sha256=$(openssl sha256 "${binary}" | awk '{print $2}')
    # if [[ "${sha256}" != "${expected_sha256}" ]]; then
    #     echo "${binary} hash mismatch: ${sha256}"
    #     exit 1
    # fi

    tar xvf "${binary}"
    local install_dir="${TEMOS_BIN}"
    mv terraform "${install_dir}"

    rm -Rf "${binary}"
} && install