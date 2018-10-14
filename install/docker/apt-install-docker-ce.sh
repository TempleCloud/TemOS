#!/bin/bash

# Install Docker.
#
# https://www.docker.com/
# https://www.docker.com/docker-ubuntu 
# https://docs.docker.com/install/linux/docker-ce/ubuntu/#os-requirements
#

function install() {
    # Remove old docker versions.
    sudo apt-get remove -y docker docker-engine docker.io
    
	# Configure docker apt repository.
	sudo apt-get update
	sudo apt-get install -y \
		apt-transport-https \
		ca-certificates \
		curl \
		software-properties-common
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo apt-key fingerprint 0EBFCD88
	sudo add-apt-repository \
   		"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   		$(lsb_release -cs) \
   		stable"

	# Install docker.
	sudo apt-get update
	sudo apt-get install -y docker-ce

	# Create and add user to docker group.
	sudo groupadd docker
	sudo usermod -aG docker $USER

	# Test installation.
	sudo docker run hello-world
} && install
