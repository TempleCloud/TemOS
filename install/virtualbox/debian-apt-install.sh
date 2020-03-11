#!/bin/bash

# Installing Virtualbox on Debian 
#
# Guide: https://computingforgeeks.com/install-virtualbox-ubuntu-debian/
#
# NB: Make sure the 'extension pack' installed
#   wget https://download.virtualbox.org/virtualbox/6.0.0/Oracle_VM_VirtualBox_Extension_Pack-6.0.0.vbox-extpack
    

# Signing Kernel Modules
#
# If your system has EFI Secure Boot enabled you may also need to sign the kernel modules 
# (vboxdrv, vboxnetflt, vboxnetadp, vboxpci) before you can load them. Please see your Linux 
# system's documentation for more information.
#
# Sign 'virtualbox' kernel modules / Reconfigure
#
# * https://askubuntu.com/questions/760671/could-not-load-vboxdrv-after-upgrade-to-ubuntu-16-04-and-i-want-to-keep-secur/768310#768310

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

    # A. Generate a new MOK cert if we do not already have one. 
    #

    # 1. If required generate a new MOK cert.
    openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -days 36500 -subj "/CN=$HOSTNAME-kernel-mod-signer/"
    # 2.Enroll the key and specify password. Remember the password! Use it to register the MOK on next boot.
    sudo mokutil --import MOK.der
    # 3. Check the key is enrolled
    mokutil --test-key MOK.der
    mkdir -p $HOME/Work/security
    mv MOK.* $HOME/Work/security

    # B. Sign the Virtualbox Kernel Modules (vboxdrv, vboxnetflt, vboxnetadp, vboxpci)
    #

    # 0. Change to the directory where the MOK keypair is located.
    # 1. Sign the required modules
    sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(sudo modinfo -n vboxdrv)
    sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(sudo modinfo -n vboxnetflt)
    sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(sudo modinfo -n vboxnetadp)
    sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(sudo modinfo -n vboxpci)
    # 2. Check the module has been signed
    tail $(sudo modinfo -n vboxdrv) | grep "Module signature appended"
    tail $(sudo modinfo -n vboxnetflt) | grep "Module signature appended"
    tail $(sudo modinfo -n vboxnetadp) | grep "Module signature appended"
    tail $(sudo modinfo -n vboxpci) | grep "Module signature appended"
    # 3. Reboot the machine and use the MOK dialog to enter the password and register each kernel module.

} && install