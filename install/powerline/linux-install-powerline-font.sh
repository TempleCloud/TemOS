#!/bin/bash

# https://github.com/powerline/fonts

function install() {
    # install fonts
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts
    # install user configuration file.
    local fconfig="${HOME}/.config/fontconfig/conf.d"
    if [ ! -d "${fconfig}" ]; then
        mkdir -p "{fconfig}"
    fi
    pushd "${fconfig}" > /dev/null
    curl -sLO https://raw.githubusercontent.com/powerline/fonts/master/fontconfig/50-enable-terminess-powerline.conf
    fc-cache -vf
    popd
    # enable 'bitmap' fonts.
    sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf
    sudo ln -s /etc/fonts/conf.avail/70-yes-bitmaps.conf /etc/fonts/conf.d/70-yes-bitmaps.conf
} && install
