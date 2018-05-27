#!/bin/bash

# Install the 'minpac' Vim configuration.

# Create a .vimrc symlink to versioned minpack-vimrc if it does not exist.
VIMCONFIG="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VIMRC=${HOME}/.vimrc
if [ ! -f "${VIMRC}" ]; then
    ln -s ${VIMCONFIG}/minpack-vimrc "${VIMRC}"
else
    echo "${VIMRC} already exists." 1>&2
fi

# Create .vim if it does not exist.
DOTVIM=${HOME}/.vim
if [ ! -d "${DOTVIM}" ]; then
    mkdir -p "${DOTVIM}"
else
    echo "${DOTVIM} already exists." 1>&2
fi

# Install minpac package manager
if [ ! -d "${DOTVIM}/pack/minpac/opt/minpac" ]; then
    mkdir -p ${DOTVIM}/pack/minpac/opt
    pushd ${DOTVIM}/pack/minpac/opt > /dev/null
    git clone https://github.com/k-takata/minpac.git
    popd  > /dev/null
else
    pushd ${DOTVIM}/pack/minpac/opt/minpac > /dev/null
    git pull
    popd > /dev/null
fi

# Install minpack managed components.
vim -E -c PackClean -c q 2> /dev/null
vim -E -c PackUpdate -c q 2> /dev/null
