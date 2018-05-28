#!/bin/bash
set -e

# References
#
# https://cloud.google.com/sdk/docs/quickstart-macos

# Example: Install component. 
#
# gcloud components install app-engine-go
# source ~./bash_profile
# gcloud init

# Example: ssh onto running instance.
#
# gcloud compute --project "trjl-158912" ssh --zone "us-central1-c" "mongodb-backend"

function install() {
    # Check Python 2.7 is installed.
    echo "Checking Python (2.7) is installed."
    python -V

    # Check temos bin dir is available and move.
    if [ ! -z "${TEMOS_BIN}" ]; then
        pushd "${TEMOS_BIN}"
    fi

    # Install gcloud from the specified archive.
    local archive="google-cloud-sdk-202.0.0-darwin-x86_64.tar.gz"
    local url="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${archive}"
    local gcloud_sdk="google-cloud-sdk"
    echo "Installing glcoud: ${archive%.*.*}"
    if [ -d "${gcloud_sdk}" ]; then
        echo "$(pwd)/${gcloud_sdk} already exists. Deleting."
        rm -Rf "${gcloud_sdk}"
    fi
    curl -O "${url}"
    tar -xvf "${archive}"
    chmod -R u+rwx "${gcloud_sdk}"
    rm -f "${archive}"
    pushd "${gcloud_sdk}"
    ./install.sh -q
    popd
    popd
    echo "Installed ${gcloud_sdk}. Ensure 'bin' directory is on path."
} && install