#!/bin/bash

# socat - Multipurpose relay (SOcket CAT)
# 
# Socat is a command line based utility that establishes two bidirectional byte streams and transfers data between them.
# 
# https://linux.die.net/man/1/socat

function install() {
    sudo apt install socat
} install