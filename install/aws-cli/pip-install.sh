#!/bin/bash

# AWS CLI              - https://aws.amazon.com/cli/
# Install AWS CLI      - https://docs.aws.amazon.com/cli/latest/userguide/install-linux.html
# Troubleshoot AWS CLI - https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-troubleshooting.html

function install() {
    pip install awscli
    chmod +x "$HOME/.local/bin/aws"
    echo "Ensure '$HOME/.local/bin' is on your path."
}

