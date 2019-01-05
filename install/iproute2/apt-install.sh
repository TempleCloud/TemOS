#!/bin/bash

# Install iproute2 commands.
#
# iproute2 contains many modern linux related configuration tools.
#
# * /sbin/ip
# * /sbin/ss
# * /sbin/bridge
# * etc
#
# See: https://packages.ubuntu.com/disco/amd64/iproute2
# See: https://packages.ubuntu.com/disco/amd64/iproute2/filelist
#

function install() {
    sudo apt install -y iproute2 iproute2-doc
} && install