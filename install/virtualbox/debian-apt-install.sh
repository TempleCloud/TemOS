#!/bin/bash

# Installing Virtualbox on Debian 
#
# Guide: https://computingforgeeks.com/install-virtualbox-ubuntu-debian/
#
# NB: Make sure the 'extension pack' installed
#   wget https://download.virtualbox.org/virtualbox/6.0.0/Oracle_VM_VirtualBox_Extension_Pack-6.0.0.vbox-extpack
    

# Configure Virtualbox
#
# Reconfigure: 'sudo /sbin/vboxconfig' (use 'dmesg' to check for errors)

function install() {

    # Configure the Virtualbox Repository
    #
    wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
    wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
    echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bionic contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list

    # Get VirtualBox. Check for new versions first.
    #
    sudo apt update
    sudo apt install -y linux-headers-$(uname -r) dkms
    sudo apt install -y virtualbox-6.0

    # Install Extension Pack
    #
    EPV=6.0.0
    wget http://download.virtualbox.org/virtualbox/${EPV}/Oracle_VM_VirtualBox_Extension_Pack-${EPV}.vbox-extpack

    # Get Guest Additions and Manual. Check for new versions first.
    #
    wget http://download.virtualbox.org/virtualbox/${EPV}/VBoxGuestAdditions_${EPV}.iso
    wget http://download.virtualbox.org/virtualbox/${EPV}/UserManual.pdf

    mkdir -p $HOME/Work/arc/virtualbox
    mv Oracle_VM_VirtualBox_Extension_Pack-${EPV}.vbox-extpack ../arc/virtualbox
    mv UserManual.pdf ../arc/virtualbox
    
} && install