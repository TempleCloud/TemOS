#!/bin/bash

# References
#
# http://ubuntuhandbook.org/index.php/2018/03/install-obs-studio-21-1-in-ubuntu-18-0416-04/

function install() {
    sudo add-apt-repository ppa:obsproject/obs-studio
    sudo apt-get update
    sudo apt-get -y install obs-studio

    sudo apt install libdvdnav4 libdvdread4 gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly libdvd-pkg
    sudo apt install ubuntu-restricted-extras
}

function uninstall() {
    sudo apt-get -y remove --autoremove obs-studio
}

if [ ! -z $1 ]; then
    $*
fi
