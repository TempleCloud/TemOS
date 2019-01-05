#!/bin/bash

# Install net-tools commands.
#
# net-tools contains many linux network related configuration tools.
# NB: Some are deprecated in favour of iproute2 tool equivilents.
#
# * /bin/netstat
# * /sbin/ifconfig
# * /sbin/route
# * /sbin/arp
# * etc
#
# See: https://packages.ubuntu.com/disco/amd64/net-tools/filelist
#

function install() {
    sudo apt install -y net-tools
} && install
