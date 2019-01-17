#!/bin/bash

# Install genisoimage command.
#
# A command line tool for building ISO 9660 CD-ROM filesystem images.
#
# See: https://wiki.debian.org/genisoimage
#

function install() {
    sudo apt install -y genisoimage
} && install

