#!/bin/bash

# Install Inkscape.
#
# Inkscape is an open-source SVG drawing package.
#
# See: https://inkscape.org/
# See: https://code.launchpad.net/~inkscape.dev/+archive/ubuntu/stable
#

function install() {
    sudo add-apt-repository ppa:inkscape.dev/stable
    sudo apt-get update
    sudo apt install -y inkscape
} && install



