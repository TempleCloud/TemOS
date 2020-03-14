#!/bin/bash

# radare2 Disassembler
#
# https://github.com/radareorg/radare2

function install() {
    local _dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    if [ ! -d "${dir}/radare2" ]; then 
        git clone git@github.com:radareorg/radare2.git
        cd radare2
    else
        cd radare2
        git pull
    fi
    sys/install.sh
    # sys/user.sh
} && install
