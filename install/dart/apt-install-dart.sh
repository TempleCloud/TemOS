#!/bin/bash

# 

function install() {
    # Add repository
    sudo apt-get update
    sudo apt-get install apt-transport-https
    sudo sh -c 'curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
    sudo sh -c 'curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
    # Install stable
    sudo apt-get update
    sudo apt-get install dart
    # Install dev
    # sudo sh -c 'curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_unstable.list > /etc/apt/sources.list.d/dart_unstable.list'
    # sudo apt-get update
    # sudo apt-get install dart
} && install
