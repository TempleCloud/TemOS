#!/bin/bash

function install() {
    pushd ~
    wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    if [ -f "~/.dropbox-dist/dropboxd &"  ]; then
        alias dropbox="~/.dropbox-dist/dropboxd &"
    fi
    popd
} && install