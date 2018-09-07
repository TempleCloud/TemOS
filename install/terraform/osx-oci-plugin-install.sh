#!/bin/bash
set -e

# References
#
# https://github.com/oracle/terraform-provider-oci

function install() {
    local version="v2.2.3"
    local url="https://github.com/oracle/terraform-provider-oci/releases/download/${version}"
    local binary="darwin_amd64.tar.gz"

    if [ ! -f "${binary}" ]; then
        curl -LO "${url}/${binary}"
    fi

    tar xvf "${binary}"
    local install_dir="${HOME}/.terraform.d/plugins/"
    mv darwin_amd64/terraform-provider-oci_${version} ${install_dir}

    rm -Rf darwin_amd64 
    rm -Rf "${binary}"
} && install