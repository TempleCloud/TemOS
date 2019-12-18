#!/bin/bash

# https://computingforgeeks.com/install-virtualbox-ubuntu-debian/

# sudo apt update && sudo apt -y upgrade

function install() {
    sudo apt -y install wget
    wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
    wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

    echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bionic contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list

    sudo apt update
    sudo apt install linux-headers-$(uname -r) dkms
    sudo apt install virtualbox-6.0 

    # wget https://download.virtualbox.org/virtualbox/6.0.0/Oracle_VM_VirtualBox_Extension_Pack-6.0.0.vbox-extpack
} && install