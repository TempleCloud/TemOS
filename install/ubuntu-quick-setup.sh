#!/bin/bash

# Configure PKI
# ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_rsa

sudo apt install -y curl 
sudo apt install -y wget

# Ensure large USB devices can be mounted.
sudo apt install -y exfat-fuse exfat-utils
sudo apt install -y gnome-tweak-tool
sudo apt install -y chrome-gnome-shell
sudo apt install -y arc-theme
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"


# Languages

# Install golang

# Install Open JDK
#
# sudo apt install -y openjdk-8-jdk
# sudo apt install -y openjdk-11-jdk
# sudo apt install -y openjdk-13-jdk
# sudo apt install -y openjdk-14-jdk
sudo apt install -y default-jdk

# Install Python 2
#
# sudo apt install python



function install_dotfiles() {

    # Configure `bash`.
    pushd ../dotfiles/bash/ > /dev/null
    ./activate-bash.sh
    popd > /dev/null

    # Install `fzf`.
    pushd fzf/ > /dev/null
    ./git-install-fzf.sh
    popd > /dev/null
    pushd ../dotfiles/bash/ > /dev/null
    ./activate-bash.sh
    popd > /dev/null

    # Install `vim`
    sudo apt-get install -y vim
    pushd ../dotfiles/vim8/ > /dev/null
    ./activate-minpack-vim.sh
    vim +PackUpdate +qall
    popd > /dev/null

    # Install `powerline`
    pushd powerline/ > /dev/null
    ./ubuntu-bash-install-powerline-fonts.sh
    popd > /dev/null

} && install_dotfiles
