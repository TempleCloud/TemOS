#!/bin/bash

# https://developer.android.com/studio/#downloads

echo "Download manually from: https://developer.android.com/studio/#downloads"
echo "unzip android-studio-ide-173.4907809-linux.zip"
echo "mv android-studio $TEMOS_BIN"
echo "pushd $TEMOS_BIN/android-studio/bin"
echo "./studio.sh"
# NB: We have to unset this afterwards to amke things work... Maybe this needs an Oracle/J2EE runtime?
echo "export JAVA_OPTS='-XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee'"
echo "unzip sdk-tools-linux-4333796.zip"
echo "mv tools $TEMOS_BIN/android-tools"
echo "sudo apt install qemu-kvm"
echo "sudo adduser $USER kvm"
echo "unset JAVA_OPTS"

