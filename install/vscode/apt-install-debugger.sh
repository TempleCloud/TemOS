#!/bin/bash

# Install 'delve' golang debugger.
# 
# * https://github.com/derekparker/delve/blob/master/Documentation/installation/linux/install.md
# * https://code.visualstudio.com/docs/editor/debugging
#

function go-install() {
    go get -u \
        github.com/derekparker/delve/cmd/dlv
} && install 

