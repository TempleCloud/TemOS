#!/bin/bash

# References
#
# https://stackoverflow.com/questions/42182706/how-to-uninstall-anaconda-completely-from-macos
# https://coderwall.com/p/u003pa/bash-startup-scripts-on-linux-and-mac-os-x

function uninstall() {
    local conda=$(which conda)
    if [ ! -z "${conda}" ]; then
        echo "Uninstalling anaconda..."
        conda install --yes anaconda-clean
        anaconda-clean --yes
        rm -f "${conda}" 
        echo "Uninstalled anaconda. If necessary update: ${HOME}/.bash_profile."
    fi
    rm -Rf "${HOME}/anaconda" "${HOME}/anaconda2" "${HOME}/anaconda3" 
    rm -Rf "${HOME}/.condarc" "${HOME}/.conda" "${HOME}/.continuum"
} && uninstall

# Source osx base profile and user profiles.
source /etc/profile 
source "${HOME}/.bashrc"