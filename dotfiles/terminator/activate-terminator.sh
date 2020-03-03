#!/bin/bash

# Activate terminator profiles.
#
function activate() {
    local id=$(date +"%Y-%m#%d%H:%M:%S")
    local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

    # Link .profile file.
    local config=${HOME}/.config/terminator/config
    if [ -f "${config}" ] && [ ! -h "${config}" ]; then
        mv "${config}" "${config}-temos-backup-${id}"
    fi
    ln -sf ${dir}/dot_config "${config}"
    echo "Activated: ${config}"
} && activate
