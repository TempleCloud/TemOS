#!/bin/bash
set -e

# Activate .agignore profiles.
#
function activate() {
    local id=$(date +"%Y-%m#%d%H:%M:%S")
    local ag_config="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

    # Link .agignore file.
    local aginore=${HOME}/.agignore
    if [ -f "${aginore}" ] && [ ! -h "${aginore}" ]; then
        mv "${aginore}" "${aginore}-temos-backup-${id}"
    fi
    ln -sf ${ag_config}/dot_agignore "${aginore}"
    echo "Activated: ${aginore}"
} && activate
    