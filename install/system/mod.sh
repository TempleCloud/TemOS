#!/bin/bash

# List hardware.
function tms::hw-info() {
    sudo lshw
}

# List PCI.
function tms::pci-info() {
    sudo lspci
}

# List Block Devices.
function tms::block-device-info() {
    sudo lsblk
}

# List screen resolution modes.
function tms::screen-info() {
    xrandr
}

# Test Grpahics
# See: http://fishgl.com/
function tms::gl-test() {
    glxinfo
    glmark2
}

# Vulkan info.
function tms::vulkan-info() {
    vulkaninfo
}