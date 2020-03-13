#!/bin/bash

# Update all
sudo apt update
sudo apt list --upgradable

# Configure Firefox
# Manual: Login Firefox, sync firefox, configure.

# Ensure we have curl
sudo apt install -y curl wget

# Ensure fuse filesystem is installed
sudo apt install -y exfat-fuse exfat-utils

 # Ensure .ssh Key
mkdir .ssh
pushd .ssh
ssh-keygen -t rsa -b 4096 -C "tim.langford@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
git config --global user.email "tim.langford@gmail.com"
git config --global user.name "Tim Langford"
# Manual: Go and register the new key with github.
popd

# Install Temos
export WORK=`pwd`/Work
mkdir -p $WORK
pushd $WORK
git apt install -y git
git clone git@github.com:templecloud/temos.git
export $TEMOS_HOME=$WORK/temos

# Install VSCode
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code
# Manual: Open up temos in vscode if required.

# Install Gnome Tweaks
sudo apt install -y gnome-tweak-tool
sudo apt install -y chrome-gnome-shell
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
# Manual: Open Tweaks and configure dark theme and the require graphics resolution.
# Manual: Goto https://extensions.gnome.org/ and configure Dock, themes, coverflow, suspend, etc.
# * https://extensions.gnome.org/extension/19/user-themes/
# * https://extensions.gnome.org/extension/307/dash-to-dock/
# * https://extensions.gnome.org/extension/826/suspend-button/

# Install Powerline
${TEMOS}/install/powerline/debian-install-powerline-fonts.sh

# Install Terminator
sudo apt install -y terminator
${TEMOS}/dotfiles/terminator/activate-terminator.sh

# Configure Bash
${TEMOS}/dotfiles/bash/activate-bash.sh
source ~/.bash_profile

# Install Fzf
${TEMOS}/install/fzf/git-install-fzf.sh
${TEMOS}/dotfiles/fzf/activate-fzf.sh

# Install Ag

# Install Vim
sudo apt install -y vim
${TEMOS}/dotfiles/vim8/activate-minpac-vim.sh
vim +PackUpdate +qall
# If necessary open vim and execute PackUpdate

# Add tc-playground Projects
${TEMOS}/dotfiles/git/update-repos.sh

# Purge all the GNOME crap.
sudo apt purge -y --auto-remove libreoffice-* thunderbird cheese totem shotwell rhythmbox simple-scan fcitx-* uim-* mozc-* mlterm-* xterm xiterm+thai im-config anthy kasumi goldendict  hdate-applet gnome-calculator gnome-calendar gnome-clocks gnome-contacts gnome-documents gnome-maps gnome-music gnome-weather gnome-sound-recorder gnome-todo gnome-klotski gnome-mines gnome-robots gnome-mahjongg gnome-nibbles gnome-sudoku gnome-tetravex swell-foop quadrapassel gnome-taquin tali lightsoff aisleriot five-or-more four-in-a-row hitori iagno
sudo apt-get clean
sudo apt-get autoremove

# NordVPN
${TEMOS}/install/nord-vpn/wget-install.sh 
# nordvpn login / nordvpn connect, etc.

# Virtual Box
${TEMOS}/install/virtualbox/debian-apt-install.sh
# MOK KEY generation - This script creates a MOK key. Rebbot to register it.

# KVM/QEMU
${TEMOS}/install/kvm/linux-apt-install.sh

# Docker
${TEMOS}/install/docker/apt-install-docker-ce.sh



