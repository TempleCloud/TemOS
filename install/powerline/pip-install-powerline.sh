#!/bin/bash

# References
#
# https://github.com/vim-airline/vim-airline-themes
# https://github.com/powerline/fonts
# https://computers.tutsplus.com/tutorials/getting-spiffy-with-powerline--cms-20740

# Configure Powerline Python
#
pip install --upgrade pip
pip install --user powerline-status
pip install --user git+git://github.com/powerline/powerline

# Install via APT
#
# https://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin
#
# sudo apt-get install -y python-pip git
# pip install --user git+git://github.com/Lokaltog/powerline