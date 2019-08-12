#!/bin/bash

# Install the kvm packages using apt.
function vm::install-kvm() {
    sudo apt install -y qemu-kvm
    sudo apt install -y libvirt-clients libvirt-daemon-system virt-manager
    sudo apt install -y bridge-utils
    sudo adduser $(whoami) libvirt
    sudo adduser $(whoami) libvirt-qemu
}