#!/bin/bash

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


# Generate a new MOK cert if we do not already have one. 
#
function create-mok() {
    # 1. If required generate a new MOK cert.
    openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -days 36500 -subj "/CN=$HOSTNAME-kernel-mod-signer/"

    # 2.Enroll the key and specify password. Remember the password! Use it to register the MOK on next boot.
    sudo mokutil --import MOK.der
    
    # 3. Check the key is enrolled
    mokutil --test-key MOK.der
    mkdir -p $HOME/Work/security
    mv MOK.* $HOME/Work/security
}

# Sign the Virtualbox Kernel Modules (vboxdrv, vboxnetflt, vboxnetadp, vboxpci)
#
function sign-vbox-kernel-modules() {
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
}

create-mok
sign-vbox-kernel-modules
