#!/bin/bash
set -e

# References
#
# https://www.gnu.org/software/mit-scheme/

function install() {
    sudo apt-get install -y mit-scheme
} && install