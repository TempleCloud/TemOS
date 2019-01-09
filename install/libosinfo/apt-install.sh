#!/bin/bash

# A utility to get a list of OS identifier/info strings. Used by libvirt. etc.
#
# The "osinfo-query" command allows extraction of information from the database. 
# TYPE can be one of "os", "platform", "device", or "deployment". With no
# conditions specified, all entities of the given type will be listed.

function install() {
    sudo apt install -y libosinfo-bin
} && install