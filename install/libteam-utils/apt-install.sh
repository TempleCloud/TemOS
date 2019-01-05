#!/bin/bash

# Install teamd daemon and manipulation commands to created 'teamed' 
# network devices.
#
# libteam-utils contains the following tools.
#
# * /usr/bin/bond2team
# * /usr/bin/teamd
# * /usr/bin/teamdctl
# * /usr/bin/teamnl
#
# See: https://packages.ubuntu.com/disco/amd64/libteam-utils/filelist
#

function install() {
    sudo apt install -y libteam-utils
} && install

