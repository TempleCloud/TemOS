#!/bin/bash

# Android Studio - Run Device

function install() {
    sudo snap install android-studio --classic
    sudo apt install adb
    sudo usermod -aG plugdev $USER
} && install