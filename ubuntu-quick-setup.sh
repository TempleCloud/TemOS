#!/bin/bash

# Configure `bash`.
pushd dotfiles/bash/ > /dev/null
./activate-bash.sh
popd > /dev/null

# Install `fzf`.
pushd install/fzf/ > /dev/null
./git-install-fzf.sh
popd > /dev/null
pushd dotfiles/bash/ > /dev/null
./activate-bash.sh
popd > /dev/null

# Install `vim`
sudo apt-get install -y vim
pushd dotfiles/vim8/ > /dev/null
./activate-minpack-vim.sh
vim +PackUpdate +qall
popd > /dev/null

# Install `powerline`
pushd install/powerline > /dev/null
./ubuntu-bash-install-powerline-fonts.sh
popd > /dev/null
