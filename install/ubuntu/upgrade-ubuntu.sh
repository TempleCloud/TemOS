#!/bin/bash

# https://linuxconfig.org/how-to-upgrade-ubuntu-to-18-10-cosmic-cuttlefish

# Ensure current distro is upto date.
#
sudo apt update 
sudo apt upgrade
sudo apt dist-upgrade
sudo apt autoremove

# Upgrade
#
# sudo do-release-upgrade -d
sudo do-release-upgrade