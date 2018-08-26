#!/bin/bash

# References
#
# https://github.com/vim-airline/vim-airline-themes
# https://github.com/powerline/fonts 
# https://github.com/abertsch/Menlo-for-Powerline
# https://coderwall.com/p/yiot4q/setup-vim-powerline-and-iterm2-on-mac-os-x

function install() {
    local meslo_url="https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf?raw=true"
    local meslo_file="Meslo LG M Regular for Powerline.tff"
    curl -L "${meslo_url}" -so "${meslo_file}"
    cp "${meslo_file}" /Library/Fonts
    mv "${meslo_file}" ${HOME}/Library/Fonts

    local menlo_url="https://github.com/abertsch/Menlo-for-Powerline/blob/master/Menlo%20for%20Powerline.ttf?raw=true"
    local menlo_file="Menlo for Powerline.ttf"
    curl -L "${menlo_url}" -so "${menlo_file}"
    cp "${menlo_file}" /Library/Fonts
    mv "${menlo_file}" ${HOME}/Library/Fonts
 } && install