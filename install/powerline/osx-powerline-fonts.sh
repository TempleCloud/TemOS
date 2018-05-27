#!/bin/bash

# References
#
# https://github.com/vim-airline/vim-airline-themes
# https://github.com/powerline/fonts 
# https://github.com/abertsch/Menlo-for-Powerline
# https://coderwall.com/p/yiot4q/setup-vim-powerline-and-iterm2-on-mac-os-x

MESLO_URL="https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf?raw=true"
MESLO_FILE="Meslo LG M Regular for Powerline.tff"
curl -L "${MESLO_URL}" -o "${MESLO_FILE}"
mv "${MESLO_FILE}" ${HOME}/Library/Fonts

MENLO_URL="https://github.com/abertsch/Menlo-for-Powerline/blob/master/Menlo%20for%20Powerline.ttf?raw=true"
MENLO_FILE="Menlo for Powerline.ttf"
curl -L "${MENLO_URL}" -o "${MENLO_FILE}"
mv "${MENLO_FILE}" ${HOME}/Library/Fonts