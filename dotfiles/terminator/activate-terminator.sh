#!/bin/bash

# Activate terminator profiles.
#
function activate() {
    local id=$(date +"%Y-%m#%d%H:%M:%S")
    local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

    # Link .profile file.
    local config_dir=${HOME}/.config/terminator
    local config=${config_dir}/config
    if [ -f "${config}" ] && [ ! -h "${config}" ]; then
        mv "${config}" "${config}-temos-backup-${id}"
    fi
    mkdir -p ${config_dir}
    ln -sf ${dir}/dot_config "${config}"
    echo "Activated: ${config}"
} && activate
