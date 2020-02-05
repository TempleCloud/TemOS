#!/bin/bash

# Configure PKI
# 
# ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_rsa

# Install bootstrap tools
# 
sudo apt install -y curl wget
sudo apt install -y git

# Ensure large USB devices can be mounted.
# 
sudo apt install -y exfat-fuse exfat-utils

# Configure GNOME
# 
sudo apt install -y gnome-tweak-tool
sudo apt install -y chrome-gnome-shell
# sudo apt install -y arc-theme
# gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

# Install `powerline`
# 
pushd powerline/ > /dev/null
./debian-install-powerline-fonts.sh
popd > /dev/null

# Configure `bash`
# 
pushd ../dotfiles/bash/ > /dev/null
./activate-bash.sh
popd > /dev/null

# Install `fzf`
# 
pushd fzf/ > /dev/null
./git-install-fzf.sh
popd > /dev/null
pushd ../dotfiles/bash/ > /dev/null
./activate-bash.sh
popd > /dev/null

# Install `vim`
# 
sudo apt install -y vim
pushd ../dotfiles/vim8/ > /dev/null
./activate-minpack-vim.sh
vim +PackUpdate +qall
popd > /dev/null

# Install `vscode`
# 
# curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
# sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
# sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
# sudo apt install -y apt-transport-https
# sudo apt update
# sudo apt install -y code
#
# Install: python, c, vim, gitlens plugins

# Install Open JDK
# 
# sudo apt install -y openjdk-8-jdk
sudo apt install -y default-jdk

# Install Python 2 / s
# 
sudo apt install python
sudo apt install python3

echo "DONE"
echo
echo "Install vim plugins: PackUpdate"
echo
echo "Install vscode plugins: GitLens, Vim, C/C++, Python, Golang"
ehco
echo "Configure scaling:"
echo " > gsettings set org.gnome.mutter experimental-features '['scale-monitor-framebuffer']"
echo
echo "Configure terminal font:"
echo " > 'Meslo LG S for Powerline Regular'"
echo