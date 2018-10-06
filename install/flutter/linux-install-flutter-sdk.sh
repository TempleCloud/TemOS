#!/bin/bash

# https://flutter.io/setup-linux/
# https://flutter.io/sdk-archive/#linux

# https://storage.googleapis.com/flutter_infra/releases/beta/linux/flutter_linux_v0.7.3-beta.tar.xz

function install() {
    local version="v0.7.3-beta"
    local binary="flutter_linux_${version}.tar.xz"
    local url="https://storage.googleapis.com/flutter_infra/releases/beta/linux/${binary}"

    if [ ! -f "${binary}" ]; then
        curl -O "${url}"
    fi

    tar xvf "${binary}"
    local install_dir="${TEMOS_BIN}"
    mv flutter "${install_dir}"

    sudo apt-get install lib32stdc++6

    # Remember to add 'flutter/bin' to path!
    PATH=${PATH}:"${TEMOS_BIN}/flutter/bin"
    flutter doctor

    rm -Rf "${binary}"
} && install

