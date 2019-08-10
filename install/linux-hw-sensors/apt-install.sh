#!/bin/bash

# https://www.cyberciti.biz/faq/how-to-check-cpu-temperature-on-ubuntu-linux/

# Sensors 
# 
# Detect Sensor : sudo sensors-detect
# Read Sensors  : sensors
# Watch Sensors : watch sensors
# 
# Configuration : /etc/modules

# HDD
# 
# https://askubuntu.com/questions/1038701/how-do-i-check-system-health/1038711#1038711
# https://askubuntu.com/questions/1059611/how-to-get-the-temperature-using-hddtemp-for-a-samsung-ssd-nvme-in-thinkpad-t480
# 
# List Drives : du
# Read Drive  : sudo hddtemp /dev/nvme0n1p5
# Read Drvie  : sudo nvme smart-log /dev/nvme0n1p5

# Conky 
# 
# https://itsfoss.com/conky-gui-ubuntu-1304/
# http://www.linuxandubuntu.com/home/5-best-linux-conky-themes


function install() {
    sudo apt install lm-sensors sensors-applet
    sudo apt install hddtemp
    sudo apt install nvme-cli

    # sudo apt install conky-all

    # conky-manager
    # sudo add-apt-repository ppa:teejee2008/ppa
    # sudo apt-get update
    # sudo apt-get install conky-manager

} && install

# LG 38GL950G