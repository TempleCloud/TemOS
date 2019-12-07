#!/bin/bash

# https://github.com/powerline/fonts

function install() {
    # Install fonts.
    echo "Installing powerline fonts..."
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts
    # Configure fonts.
    echo "Configuring powerline fonts..."
    local fconfig="${HOME}/.config/fontconfig/conf.d"
    if [ ! -d "${fconfig}" ]; then
        mkdir -p "${fconfig}"
    fi
    pushd "${fconfig}" > /dev/null
    curl -sLO https://raw.githubusercontent.com/powerline/fonts/master/fontconfig/50-enable-terminess-powerline.conf
    fc-cache -vf
    popd
    # Enable 'bitmap' fonts.
    echo "Enabling powerline bitmap fonts..."
    sudo rm -f /etc/fonts/conf.d/70-no-bitmaps.conf
    sudo ln -sf /etc/fonts/conf.avail/70-yes-bitmaps.conf /etc/fonts/conf.d/70-yes-bitmaps.conf
    # Final Configuration
    echo "Remember to configure your terminal and browser to use: 'Meslo LG S for Powerline Regular'"
} && install
