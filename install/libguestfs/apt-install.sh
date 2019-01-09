#!/bin/bash

# Install libguestfs tools, for example, `guestfish`.
#
# Guestfish is a shell and command-line tool for examining and modifying 
# virtual machine filesystems. It uses libguestfs and exposes all of the 
# functionality of the guestfs API, see guestfs(3).

function install() {
    sudo apt install libguestfs-tools
} && install