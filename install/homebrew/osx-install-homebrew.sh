#!/bin/bash
set -e

# Resources
#
# https://brew.sh/
# NB: Requires ruby installed.

function install() {
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
} && install