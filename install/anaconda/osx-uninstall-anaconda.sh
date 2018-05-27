#!/bin/bash

# https://stackoverflow.com/questions/42182706/how-to-uninstall-anaconda-completely-from-macos
# https://coderwall.com/p/u003pa/bash-startup-scripts-on-linux-and-mac-os-x

function uninstall_conda() {
    local _conda=$(which conda)
    if [ ! -z "${_conda}" ]; then
        echo "Uninstalling anaconda..."
        conda install --yes anaconda-clean
        anaconda-clean --yes
        rm -f "${_conda}" 
        echo "Uninstalled anaconda. If necessary update: ${HOME}/.bash_profile."
    fi
    rm -Rf "${HOME}/anaconda" "${HOME}/anaconda2" "${HOME}/anaconda3" 
    rm -Rf "${HOME}/.condarc" "${HOME}/.conda" "${HOME}/.continuum"
}

uninstall_conda
source /etc/profile 
source "${HOME}/.bash_profile"