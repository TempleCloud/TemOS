#!/bin/bash

# Install Docker.
#
# https://www.docker.com/
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-debian-10


function install() {
    # Remove old docker versions.
    sudo apt-get remove -y docker docker-engine docker.io

    # Install Docker
    sudo apt update
    sudo apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
    sudo apt update
    # apt-cache policy docker-ce
    sudo apt install -y docker-ce
    sudo systemctl start docker
    sudo systemctl status docker

    # Configure User - 
    sudo usermod -aG docker ${USER}
    # May need reboot. Activate by starting a new session (or log out and back in again)
    # su - ${USER}
    # Check user is in group
    # id -nG

	# Test installation.
	sudo docker run hello-world
} && install