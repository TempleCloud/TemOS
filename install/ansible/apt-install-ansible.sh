#!/bin/bash

# https://www.ansible.com/
# deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main 

function install() {
   
    local ansible="deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main"
    local apts="/etc/apt/sources.list"
    sudo bash -c "grep -q -F '${ansible}' ${apts} || echo ${ansible} >> ${apts}"

    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
    sudo apt-get update
    sudo apt-get install ansible

} && install

