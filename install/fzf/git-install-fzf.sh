#!/bin/bash
set -e

# Resources
#
# https://github.com/junegunn/fzf

function install() {
    local fzf_dir="${HOME}/.fzf"
    if [ ! -d ${fzf_dir} ]; then
        git clone --depth 1 https://github.com/junegunn/fzf.git "${fzf_dir}"
        ./"${fzf_dir}"/install
        echo "Installed fzf. Ensure ${fzf_dir} is on your path."
    else
        pushd ${fzf_dir} > /dev/null 
        git pull && ./install
        popd > /dev/null
        echo "Updated fzf."
    fi
 } && install
