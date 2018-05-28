#!/bin/bash

# Install the 'minpac' Vim configuration.

# Configure Vim.
#
function activate() {
    # Create a .vimrc symlink to versioned minpack-vimrc if it does not exist.
    local vim_config="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    local vimrc=${HOME}/.vimrc
    if [ ! -f "${vimrc}" ]; then
        ln -s ${vim_config}/minpack-vimrc "${vimrc}"
    else
        echo "${vimrc} already exists." 1>&2
    fi

    # Create .vim if it does not exist.
    local dot_vim=${HOME}/.vim
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

    # Install minpack managed components.
    vim -E -c PackClean -c q 2> /dev/null
    vim -E -c PackUpdate -c q 2> /dev/null

    echo "Vim packages installed. If necessary run 'PackUpdate' from inside vim."
} && activate