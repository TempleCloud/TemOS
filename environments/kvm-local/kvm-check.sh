#!/bin/bash

# kvm =========================================================================
#
# Kernel Virtual Machine - Virtualised Machine
#
# =============================================================================

# Check Intel hardware virtualisation is installed...
function vm::check-intel-hw-virtualisation-enabled() {
    local res=$(grep -e 'vmx' /proc/cpuinfo | grep flag | wc -l)
    if [ "${res}" == 0 ]; then
        echo "Failure: Intel VMX hardware extension not enabled."
    else
        echo "Success: Intel VMX hardware extension is enabled."
    fi
}

# Check AMD hardware virtualisation is installed...
function vm::check-amd-hw-virtualisation-enabled() {
    local res=$(grep -e 'svm' /proc/cpuinfo | grep flag | wc -l)
    if [ "${res}" == "0" ]; then
        echo "Failure: AMD SVM hardware extension not enabled."
    else 
        echo "Success: AMD SVM hardware extension is enabled."
    fi
}

# Check KVM kernel module is installed...
function vm::check-kvm-kernel-mod-loaded() {
    local res=$(lsmod | grep kvm)
    if [ -z "${res}" ]; then
        echo "Failure: KVM kernel module not loaded."
    else
       echo "Success: KVM kernel module is loaded."     
    fi
}

# Check the status of KVM and libvirtd
function vm::check() {
    sudo

    echo
    printf "\u001b[32m"
    printf "#1 - Testing KVM:\n"
    printf "\u001b[0m"
    echo
    kvm-ok

    echo
    printf "\u001b[32m"
    echo "#3 - Check '/dev/kvm':"
    printf "\u001b[0m"
    echo
    sudo ls -l /dev/kvm
    echo

    echo
    printf "\u001b[32m"
    echo "#2 - Testing VM List:"
    printf "\u001b[0m"
    echo
    virsh list --all
    echo

    echo
    printf "\u001b[32m"
    echo "#4 - Check 'libvirt-sock':"
    printf "\u001b[0m"
    echo
    sudo ls -la /var/run/libvirt/libvirt-sock
    echo

    echo
    printf "\u001b[32m"
    echo "#5 - Check 'libvirtd' status:"
    printf "\u001b[0m"
    echo
    sudo systemctl status libvirtd  -l --no-pager
    echo
}
