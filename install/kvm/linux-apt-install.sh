   #!/bin/bash
   
   # * [Debian 10 KVM / QEMU / LibVirt](https://linuxhint.com/install_kvm_debian_10/)

function install() {
    grep --color --perl-regexp 'vmx|svm' /proc/cpuinfo
    sudo apt update
    # Install KVM / QEUME
    sudo apt install -y qemu qemu-kvm qemu-system qemu-utils
    # Install Virt
    sudo apt install -y libvirt-clients libvirt-daemon-system virtinst
    # Install UI
    sudo apt install -y virt-manager
    # Start virt service
    sudo systemctl start libvirtd
    sudo systemctl status libvirtd

    # Add user to groups 
    #
    # sudo adduser $(whoami) libvirt
    # sudo adduser $(whoami) libvirt-qemu
}

