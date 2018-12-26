#!/bin/bsh

function install () {
    # Add to /etc/apt/sources.list
    # deb http://ftp.debian.org/debian stretch-backports main
    #
    # See: https://gnunn1.github.io/tilix-web/manual/vteconfig/ 
    #
    sudo apt update
    sudo apt install tilix -y
    ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh
    
} && install
