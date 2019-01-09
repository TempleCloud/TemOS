#!/bin/bash

# qemu-utils 
# 
# > https://packages.ubuntu.com/cosmic/qemu-utils
# > https://packages.ubuntu.com/cosmic/amd64/qemu-utils/filelist
#
# Utilities for 'qemu':
# 
# * '/usr/bin/ivshmem-client
# * '/usr/bin/ivshmem-server
# * '/usr/bin/qemu-img  - A command line utility to create, convert and modify images offline. 
#                         It can handle all image formats supported by QEMU.
# * '/usr/bin/qemu-io -   A command line utility to exercise the QEMU I/O path
# * '/usr/bin/qemu-nbd -  A command line utility to export a QEMU disk image using the NBD protocol.
#
function install() {
    sudo apt install -y qemu-utils
} && install

