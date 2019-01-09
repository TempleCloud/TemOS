#!/bin/bash

# uml-utils 
# 
# > https://packages.ubuntu.com/cosmic/uml-utilities
# > https://packages.ubuntu.com/cosmic/amd64/uml-utilities/filelist
#
# Utilities for 'user mode linux':
# 
# * /usr/bin/humfsify
# * /usr/bin/jailtest
# * /usr/bin/tunctl
# * /usr/bin/uml_mconsole
# * /usr/bin/uml_mkcow
# * /usr/bin/uml_moo
# * /usr/bin/uml_mount
# * /usr/bin/uml_net
# * /usr/bin/uml_switch
# * /usr/bin/uml_watchdog
# * /usr/lib64/uml/port-helper
# * /usr/sbin/jail_uml
#

function install() {
    sudo apt install -y uml-utilities
} && install