#!/bin/bash
set -e

# Resources
# 
# Script: https://raw.githubusercontent.com/Homebrew/install/master/uninstall
# Help:  ./uninstall --help 
#
# https://brew.sh/
# NB: Requires ruby installed.

function uninstall() {
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
} && uninstall