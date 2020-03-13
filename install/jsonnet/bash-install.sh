#!/bin/bash


# sudo yum install gcc-c++

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function install() {
    if [ -d "jsonnet" ]; then
        pushd jsonnet
        git pull
        pod
    else
        git clone https://github.com/google/jsonnet
    fi
}
