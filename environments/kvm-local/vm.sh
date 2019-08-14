#!/bin/bash

# References ==================================================================
#
# KVM                       : https://www.linux-kvm.org/page/Main_Page
# LibVirt                   : https://wiki.libvirt.org/page/Main_Page
# Netson Unattended Install : https://github.com/netson/ubuntu-unattended
#
# =============================================================================

source "${TEMOS_HOME}/environments/kvm-local/kvm-install.sh"
source "${TEMOS_HOME}/environments/kvm-local/kvm-check.sh"


# libvirt =====================================================================
#
# LibVirt
#
# =============================================================================

[ -z "${LIBVIRT_URL}" ] && export LIBVIRT_URL="qemu:///system"

# Check the libvirtd daemon.
function vn::libvirtd-status() {
    sudo systemctl status libvirtd  -l --no-page
}

# Restart the libvirtd daemon.
function vm::libvirtd-restart() {
    sudo systemctl restart libvirtd
}

# Open 'virt-manager' UI.
function vm::open-virt-manager() {
    virt-manager &
}

function vm::init() {
    vm::install-packages
    vm::create-iso-store
    vm::create-storage-pool
    vm::download-isos
}

# Domains =====================================================================
#

# List domains
# https://www.cyberciti.biz/faq/linux-list-a-kvm-vm-guest-using-virsh-command/
function vm::list() {
    virsh list --all
}

# Reboot a domain.
function vm::reboot() {
    local domain=$1
    virsh reboot "${domain}"
}

# Start a (previously defined) inactive domain.
function vm::start() {
    local domain=$1
    virsh start "${domain}"
}

# Destroy (stop) a domain.
function vm::stop() {
    local domain=$1
    virsh destroy "${domain}"
}

# Suspend a domain.
function vm::suspend() {
    local domain=$1
    virsh suspend "${domain}"
}

# Shutdown a domain.
function vm::shutdown() {
    local domain=$1
    virsh shutdown "${domain}"
}

# Shutdown a domain.
function vm::status() {
    local domain=$1
    virsh dominfo "${domain}"
}


# Networking ==================================================================
#
# * https://libvirt.org/formatnetwork.html
#

[ -z "${LIBVIRT_NETWORK_NAME}" ] && export LIBVIRT_NETWORK_NAME="kvm-default"
[ -z "${LIBVIRT_NETWORK_SPEC}" ] && export LIBVIRT_NETWORK_SPEC="${PWD}/kvm-default-network.xml"

# LIST virtual networks. [net-list]
function vm::network-list() {
    local url="${1:-${LIBVIRT_URL}}"
    virsh -c "${url}" net-list --all
}

# GET the named network. [net-dump]
function vm::network-get() {
    local name="${1:-${LIBVIRT_NETWORK_NAME}}"
    local url="${2:-${LIBVIRT_URL}}"
    virsh -c "${url}" net-dumpxml "${name}"
}

# EDIT the named network. [net-edit]
function vm::network-edit() {
    local name="${1:-${LIBVIRT_NETWORK_NAME}}"
    local url="${2:-${LIBVIRT_URL}}"
    virsh -c "${url}" net-edit "${name}"
}

# CREATE a named network. [net-define]
function vm::network-create() {
    local nw_spec="${1:-${LIBVIRT_NETWORK_SPEC}}"
    local url="${2:-${LIBVIRT_URL}}"
    virsh -c "${url}" net-define "${nw_spec}"
}

# DELETE a named network. [net-undefine]
function vm::network-delete() {
    local name="${1:-${LIBVIRT_NETWORK_NAME}}"
    local url="${2:-${LIBVIRT_URL}}"
    virsh -c "${url}" net-undefine "${name}"
}

# START a named network. [net-start]
function vm::network-start() {
    local name="${1:-${LIBVIRT_NETWORK_NAME}}"
    local url="${2:-${LIBVIRT_URL}}"
    virsh -c "${url}" net-start "${name}" > /dev/null
    if [ $? == 0 ]; then
        echo "Network default started"
    fi
}

# STOP a named network. [net-destroy]
function vm::network-stop() {
    local name="${1:-${LIBVIRT_NETWORK_NAME}}"
    local url="${2:-${LIBVIRT_URL}}"
    virsh -c "${url}" net-destroy "${name}" > /dev/null
    if [ $? == 0 ]; then
        echo "Network default stopped"
    fi
}

# AUTOSTART a named network on boot. [net-autostart]
function vm::network-autostart() {
    local name="${1:-${LIBVIRT_NETWORK_NAME}}"
    local url="${2:-${LIBVIRT_URL}}"
    virsh -c "${url}" net-autostart "${name}"
}

# Get public ip for domain form dhcp
# https://www.cyberciti.biz/faq/find-ip-address-of-linux-kvm-guest-virtual-machine/ 
function vm::ip() {
    local domain=$1
    virsh -q net-dhcp-leases "${domain}" | awk '{print $5}' | cut -d/ -f 1
}

# ssh into target machine
function vm::ssh() {
    local domain=$1
    local domain_ip=$(vm::ip ${domain})
    ssh "${domain_ip}"
}

# Storage Pools ===============================================================
#

KVM_DISK_POOL="kvm-dev"
# Create a home for storage device pools.
function vm::create-storage-pool() {
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    mkdir -p "${DIR}/${KVM_DISK_POOL}"
}

# iso images ==================================================================
#

# Create a home for local ISO images.
KVM_ISO_HOME="kvm-iso"
function vm::create-iso-store() {
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    mkdir -p "${DIR}/${KVM_ISO_HOME}"
}

# Download iso if they don't exist already.
#
function vm::download-isos() {
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
function vm::create-unattended-ubuntu-install() {
    wget https://raw.githubusercontent.com/netson/ubuntu-unattended/master/create-unattended-iso.sh
    chmod +x create-unattended-iso.sh
    sudo ./create-unattended-iso.sh
}

# connection ==================================================================
#

function vm::init-serial() {
    sudo systemctl enable serial-getty@ttyS0.service
    sudo systemctl start serial-getty@ttyS0.service
}

# Main ========================================================================
#

alias vm="${TEMOS_HOME}/environments/kvm-local/vm.sh "

if [ ! -z "$1" ]; then
    vm::$*
fi
