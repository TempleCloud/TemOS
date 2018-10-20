#!/bin/bash

# https://askubuntu.com/questions/1040440/graphics-drivers-for-intel-nuc-hades-canyon-nuc8i7hvk-amd-radeon-rx-vega-gh
# https://askubuntu.com/questions/1040440/graphics-drivers-for-intel-nuc-hades-canyon-nuc8i7hvk-amd-radeon-rx-vega-gh

wget -m -np https://people.freedesktop.org/~agd5f/radeon_ucode/vegam/
sudo cp -R /lib/firmware/amdgpu /lib/firmware/amdgpu-bu
sudo cp people.freedesktop.org/~agd5f/radeon_ucode/vegam/*.bin /lib/firmware/amdgpu
sudo /usr/sbin/update-initramfs -u -k all
