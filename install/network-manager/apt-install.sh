#!/bin/bash

# Install network-manager commands.
#
# network-manager contains high-level network configuration tools.
# This also includes an ncurses terminal ui.
#
# /usr/bin/nm-online
# /usr/bin/nmcli
# /usr/bin/nmtui
# 
# /usr/bin/nmtui-connect
# /usr/bin/nmtui-edit
# /usr/bin/nmtui-hostname
#
# See: https://packages.ubuntu.com/disco/amd64/network-manager
# See: https://packages.ubuntu.com/disco/amd64/network-manager/filelist
#

function install() {
    sudo apt install -y network-manager
} && install