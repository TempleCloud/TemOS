#!/bin/bash
set -e

function install() {
    # Check temos bin dir is available and move.
    if [ ! -z "${TEMOS_BIN}" ]; then
        pushd "${TEMOS_BIN}"
    fi

    local version="v1.10.2"
    curl -o kubectl https://storage.googleapis.com/kubernetes-release/release/"${version}"/bin/darwin/amd64/kubectl
    chmod +x kubectl

    # Alternatively install locally...
    # sudo mv kubectl /usr/local/bin/

    echo "Installed ${gcloud_sdk}. Ensure '${TEMOS_BIN}; directory is on path."
    popd

} && install