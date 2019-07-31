#!/bin/bash

function install() {
    pip install awscli
    echo "Ensure '$HOME/.local/bin' is on your path."
}

