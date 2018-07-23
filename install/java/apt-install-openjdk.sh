#!/bin/bash

# Install JDK.
#
# https://www.java.com/en/
# https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-get-on-ubuntu-16-04
# https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-18-04
#

sudo apt update
sudo apt install -y default-jdk
java -version
javac -version
