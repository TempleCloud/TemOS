#!/bin/bash

# References ==================================================================
#
# KVM                       : https://www.linux-kvm.org/page/Main_Page
# LibVirt                   : https://wiki.libvirt.org/page/Main_Page
# Netson Unattended Install : https://github.com/netson/ubuntu-unattended
#
# =============================================================================

# kvm =========================================================================
#
# Kernel Virtual Machine - Virtualised Machine
#
# =============================================================================

# Check Intel hardware virtualisation is installed...
function kvm::check-intel-hw-virtualisation-enabled() {
    local res=$(grep -e 'vmx' /proc/cpuinfo | grep flag | wc -l)
    if [ "${res}" == 0 ]; then
        echo "Failure: Intel VMX hardware extension not enabled."
    else
        echo "Success: Intel VMX hardware extension is enabled."
    fi
}

# Check AMD hardware virtualisation is installed...
function kvm::check-amd-hw-virtualisation-enabled() {
    local res=$(grep -e 'svm' /proc/cpuinfo | grep flag | wc -l)
    if [ "${res}" == "0" ]; then
        echo "Failure: AMD SVM hardware extension not enabled."
    else 
        echo "Success: AMD SVM hardware extension is enabled."
    fi
}

# Check KVM kernel module is installed...
function kvm::check-kvm-kernel-mod-loaded() {
    local res=$(lsmod | grep kvm)
    if [ -z "${res}" ]; then
        echo "Failure: KVM kernel module not loaded."
    else
       echo "Success: KVM kernel module is loaded."     
    fi
}

# Check the status of KVM and libvirtd
function kvm::check() {
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

# Install the kvm packages using apt.
function kvm::install-packages() {
    sudo apt install -y qemu-kvm
    sudo apt install -y libvirt-clients libvirt-daemon-system virt-manager
    sudo apt install -y bridge-utils
    sudo adduser $(whoami) libvirt
    sudo adduser $(whoami) libvirt-qemu
}

# libvirt =====================================================================
#
# LibVirt
#
# =============================================================================


[ -z "${LIBVIRT_URL}" ] && export LIBVIRT_URL="qemu:///system"

# Restart the libvirtd daemon.
function kvm:restart-libvirtd() {
    sudo systemctl restart libvirtd
}

# Open 'virt-manager' UI.
function kvm::open-virt-manager() {
    virt-manager &
}

function kvm::init() {
    kvm::install-packages
    kvm::create-iso-store
    kvm::create-storage-pool
    kvm::download-isos
}

# Networking ==================================================================
#
# * https://libvirt.org/formatnetwork.html
#

[ -z "${LIBVIRT_NETWORK_NAME}" ] && export LIBVIRT_NETWORK_NAME="kvm-default"
[ -z "${LIBVIRT_NETWORK_SPEC}" ] && export LIBVIRT_NETWORK_SPEC="${PWD}/kvm-default-network.xml"

# LIST virtual networks. [net-list]
function kvm::network-list() {
    local url="${1:-${LIBVIRT_URL}}"
    virsh -c "${url}" net-list --all
}

# GET the named network. [net-dump]
function kvm::network-get() {
    local name="${1:-${LIBVIRT_NETWORK_NAME}}"
    local url="${2:-${LIBVIRT_URL}}"
    virsh -c "${url}" net-dumpxml "${name}"
}

# EDIT the named network. [net-edit]
function kvm::network-edit() {
    local name="${1:-${LIBVIRT_NETWORK_NAME}}"
    local url="${2:-${LIBVIRT_URL}}"
    virsh -c "${url}" net-edit "${name}"
}

# CREATE a named network. [net-define]
function kvm::network-create() {
    local nw_spec="${1:-${LIBVIRT_NETWORK_SPEC}}"
    local url="${2:-${LIBVIRT_URL}}"
    virsh -c "${url}" net-define "${nw_spec}"
}

# DELETE a named network. [net-undefine]
function kvm::network-delete() {
    local name="${1:-${LIBVIRT_NETWORK_NAME}}"
    local url="${2:-${LIBVIRT_URL}}"
    virsh -c "${url}" net-undefine "${name}"
}

# START a named network. [net-start]
function kvm::network-start() {
    local name="${1:-${LIBVIRT_NETWORK_NAME}}"
    local url="${2:-${LIBVIRT_URL}}"
    virsh -c "${url}" net-start "${name}" > /dev/null
    if [ $? == 0 ]; then
        echo "Network default started"
    fi
}

# STOP a named network. [net-destroy]
function kvm::network-stop() {
    local name="${1:-${LIBVIRT_NETWORK_NAME}}"
    local url="${2:-${LIBVIRT_URL}}"
    virsh -c "${url}" net-destroy "${name}" > /dev/null
    if [ $? == 0 ]; then
        echo "Network default stopped"
    fi
}

# AUTOSTART a named network on boot. [net-autostart]
function kvm::network-autostart() {
    local name="${1:-${LIBVIRT_NETWORK_NAME}}"
    local url="${2:-${LIBVIRT_URL}}"
    virsh -c "${url}" net-autostart "${name}"
}


# Storage Pools ===============================================================
#

KVM_DISK_POOL="kvm-dev"
# Create a home for storage device pools.
function kvm::create-storage-pool() {
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    mkdir -p "${DIR}/${KVM_DISK_POOL}"
}

# iso images ==================================================================
#

# Create a home for local ISO images.
KVM_ISO_HOME="kvm-iso"
function kvm::create-iso-store() {
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    mkdir -p "${DIR}/${KVM_ISO_HOME}"
}

# Download iso if they don't exist already.
#
function kvm::download-isos() {
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    pushd "${DIR}/${KVM_ISO_HOME}" > /dev/null

    # alpine-standard-3.8.2-x86_64.iso
    if [ ! -f "CentOS-7-x86_64-Minimal-1810.iso" ]; then
        curl -LO http://dl-cdn.alpinelinux.org/alpine/v3.8/releases/x86_64/alpine-standard-3.8.2-x86_64.iso
    fi  

    # ubuntu-18.10-live-server-amd64.iso
    if [ ! -f "ubuntu-19.04-live-server-amd64.iso" ]; then
        curl -LO http://releases.ubuntu.com/19.04/ubuntu-19.04-live-server-amd64.iso
    fi

    # ubuntu-18.10-live-server-amd64.iso
    if [ ! -f "ubuntu-18.10-live-server-amd64.iso" ]; then
        curl -LO http://releases.ubuntu.com/18.10/ubuntu-18.10-live-server-amd64.iso
    fi
    # ubuntu-18.10-desktop-amd64.iso
    if [ ! -f "ubuntu-18.10-desktop-amd64.iso" ]; then
        curl -LO http://releases.ubuntu.com/18.10/ubuntu-18.10-desktop-amd64.iso
    fi

    # CentOS-7-x86_64-DVD-1810.iso
    if [ ! -f "CentOS-7-x86_64-Minimal-1810.iso" ]; then
        curl -LO http://mirror.ox.ac.uk/sites/mirror.centos.org/7.6.1810/isos/x86_64/CentOS-7-x86_64-Minimal-1810.iso
    fi    
    # CentOS-7-x86_64-DVD-1810.iso
    if [ ! -f "CentOS-7-x86_64-DVD-1810.iso" ]; then
        curl -LO http://mirror.ox.ac.uk/sites/mirror.centos.org/7.6.1810/isos/x86_64/CentOS-7-x86_64-DVD-1810.iso
    fi

    popd > /dev/null
}

# Create an unattended ubuntu install.
# 
function kvm::create-unattended-ubuntu-install() {
    wget https://raw.githubusercontent.com/netson/ubuntu-unattended/master/create-unattended-iso.sh
    chmod +x create-unattended-iso.sh
    sudo ./create-unattended-iso.sh
}

# connection ==================================================================
#

function kvm::init-serial() {
    sudo systemctl enable serial-getty@ttyS0.service
    sudo systemctl start serial-getty@ttyS0.service
}

# Connecition 
# 
# virsh list
#   virsh console khack
#   virsh console 2
# 
# ssh temple@192.168.122.21

# Main ========================================================================
#



if [ ! -z "$1" ]; then
    kvm::$*
fi
