#!/bin/bash
set -e

# References
#
# https://cloud.google.com/sdk/docs/downloads-apt-get

# Example: Install component. 
#
# gcloud components install app-engine-go
# source ~./bash_profile
# gcloud init
# gcloud --help

# Example: List instances...
#
# gcloud compute instances list

# Example: ssh onto running instance.
#
# gcloud compute --project "trjl-158912" ssh --zone "us-central1-c" "mongodb-backend"

function install() {
    # Determine distribution.
    export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"

    # Add distribution package.
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

    # Import Google repo public-key
    sudo apt-get install -y apt-transport-https
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

    # Install gcloud sdk
    sudo apt-get update && sudo apt-get install -y google-cloud-sdk

    # Install required plugin packages.
    #
    # sudo apt-get install -y google-cloud-sdk-app-engine-python
    # sudo apt-get install -y google-cloud-sdk-app-engine-python-extras
    # sudo apt-get install -y google-cloud-sdk-app-engine-java
    # sudo apt-get install -y google-cloud-sdk-app-engine-go
    # sudo apt-get install -y google-cloud-sdk-datalab
    # sudo apt-get install -y google-cloud-sdk-datastore-emulator
    # sudo apt-get install -y google-cloud-sdk-pubsub-emulator
    # sudo apt-get install -y google-cloud-sdk-cbt
    # sudo apt-get install -y google-cloud-sdk-cloud-build-local
    # sudo apt-get install -y google-cloud-sdk-bigtable-emulator
    # sudo apt-get install -y kubectl

    # Initialise gcloud - Requires manual interaction...
    #
    # gcloud init
    echo "Remember to initilaise gcloud with: gcloud init"

} && install
