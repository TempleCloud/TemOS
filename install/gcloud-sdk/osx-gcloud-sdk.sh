#!/bin/bash
set -e

# https://cloud.google.com/sdk/docs/quickstart-macos

# Check Python 2.7 is installed.
echo "Checking Python (2.7) is installed."
python -V

# Check temos bin dir is available and move.
if [ ! -z "${TEMOS_BIN}" ]; then
    echo "move to"
    pushd "${TEMOS_BIN}"
fi

# Install gcloud from the specified archive.
ARCHIVE="google-cloud-sdk-202.0.0-darwin-x86_64.tar.gz"
URL="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${ARCHIVE}"
echo "Installing glcoud: ${ARCHIVE%.*.*}"
curl -O "${URL}"
tar -xvf "${ARCHIVE}"
chmod -R u+rwx google-cloud-sdk
pushd google-cloud-sdk
./install.sh -q

# Example: Install component. 
#
# gcloud components install app-engine-go
# source ~./bash_profile
# gcloud init

# Example: ssh onto running instance.
#
# gcloud compute --project "trjl-158912" ssh --zone "us-central1-c" "mongodb-backend"