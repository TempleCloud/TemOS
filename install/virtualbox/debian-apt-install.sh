#!/bin/bash

# https://computingforgeeks.com/install-virtualbox-ubuntu-debian/

# sudo apt update && sudo apt -y upgrade

function install() {

    wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
    wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

    echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bionic contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list

    sudo apt update
    sudo apt install linux-headers-$(uname -r) dkms
    sudo apt install virtualbox-6.0

    # Install Extension Pack
    #
    wget http://download.virtualbox.org/virtualbox/6.0.0/Oracle_VM_VirtualBox_Extension_Pack-6.0.0.vbox-extpack

    # Get Guest Additions and Manual
    #
    wget http://download.virtualbox.org/virtualbox/6.0.0/VBoxGuestAdditions_6.0.0.iso
    wget http://download.virtualbox.org/virtualbox/6.0.0/UserManual.pdf

    # Sign vboxdrv
    #
    # 1. If required generate a cert.
    openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -days 36500 -subj "/CN=turing-kernel-mod-signer/"
    
    # 2. Sign the required modules
    sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vboxdrv)
    
    # Check the module has been signed
    # tail $(sudo modinfo -n vboxdrv) | grep "Module signature appended"
    
    # 3.Enroll the key and specify password.
    sudo mokutil --import MOK.der

    # Rebobt machine and specify password.

    # Check the key is enrolled
    mokutil --test-key MOK.der

    # wget https://download.virtualbox.org/virtualbox/6.0.0/Oracle_VM_VirtualBox_Extension_Pack-6.0.0.vbox-extpack
    
    # Sign 'vboxdrv' kernel module  / Reconfigure
    #
    # * https://askubuntu.com/questions/760671/could-not-load-vboxdrv-after-upgrade-to-ubuntu-16-04-and-i-want-to-keep-secur/768310#768310




} && install