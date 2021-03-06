#!/bin/bash

# Install Visual Studio Code.
#
# https://code.visualstudio.com/docs/setup/linux
#

function install() {
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

    sudo apt-get install -y apt-transport-https
    sudo apt update
    sudo apt install -y code
} && install

function install-rpm() {
    curl -L "https://go.microsoft.com/fwlink/?LinkID=760868" > vscode.deb
    sudo apt install ./vscode.deb
    rm vscode.deb
}
