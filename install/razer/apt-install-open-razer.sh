#!/bin/bash
set -e

# References
#
# https://openrazer.github.io/

sudo add-apt-repository ppa:openrazer/stable
# sudo add-apt-repository ppa:openrazer/daily
sudo apt update
sudo apt install -y openrazer-meta


# References
#
# https://github.com/polychromatic/polychromatic

sudo add-apt-repository ppa:polychromatic/stable
sudo apt update
sudo apt install -y polychromatic