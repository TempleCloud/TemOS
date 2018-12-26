#!/bin/bash

# https://www.reddit.com/r/Crostini/wiki/howto/install-vscode

function install() {
    curl -L "https://go.microsoft.com/fwlink/?LinkID=760868" > vscode.deb
    sudo apt install ./vscode.deb
    rm vscode.deb
} && install

