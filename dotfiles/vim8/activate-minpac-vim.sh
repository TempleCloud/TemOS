#!/bin/bash

# Install 'minpack' .vimrc dotfile configuration.

# Activate .vimrc profiles. 
#
function activate() {
    local id=$(date +"%Y-%m#%d%H:%M:%S")
    local vim_config="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    
    # If .vimrc exists and is not a symlink then rename it.
    local vimrc=${HOME}/.vimrc
    if [ -f "${vimrc}" ] && [ ! -h "${vimrc}" ]; then
        mv "${vimrc}" "${vimrc}-temos-backup-${id}"
    fi
    # Ensure .vimrc is linked to the versioned minpac-vimrc.
    ln -sf ${vim_config}/minpac-vimrc "${vimrc}"
    echo "Activated: ${vimrc}"

    # If .vim exists renamed it.
    local dot_vim=${HOME}/.vim
    if [ -d "${dot_vim}" ]; then
        mv "${dot_vim}" "${dot_vim}-temos-backup-${id}"
    fi
    # Create .vim if it does not exist.
    if [ ! -d "${dot_vim}" ]; then
        mkdir -p "${dot_vim}"
    else
        echo "${dot_vim} already exists." 1>&2
    fi

    # Install minpac package manager
    if [ ! -d "${dot_vim}/pack/minpac/opt/minpac" ]; then
        mkdir -p ${dot_vim}/pack/minpac/opt
        pushd ${dot_vim}/pack/minpac/opt > /dev/null
        git clone https://github.com/k-takata/minpac.git
        popd  > /dev/null
    else
        pushd ${dot_vim}/pack/minpac/opt/minpac > /dev/null
        git pull
        popd > /dev/null
    fi

    # Install minpack managed plugin components.
    vim -E -c PackClean -c q 2> /dev/null
    vim -E -c PackUpdate -c q 2> /dev/null

    echo "Vim packages installed. If necessary run 'PackUpdate' from inside vim."
} && activate
