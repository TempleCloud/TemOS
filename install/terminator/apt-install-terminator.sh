#!/bin/bash

# https://gnometerminator.blogspot.com/p/introduction.html

function install() {
    sudo add-apt-repository ppa:gnome-terminator
    sudo apt-get update
    sudo apt-get install terminator
}

