#!/bin/bash

# Install the 'minpac' Vim configuration.

# Resources
#
# https://hackernoon.com/a-gentle-introduction-to-tmux-8d784c404340

# Configure tmux.
#
function activate() {
    local id=$(date +"%Y-%m#%d%H:%M:%S")
    local tmux_config="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    
    # Link .tmux.conf file.
    local tmux_conf=${HOME}/.tmux.conf
    if [ -f "${tmux_conf}" ] && [ ! -h "${tmux_conf}" ]; then
        mv "${tmux_conf}" "${tmux_conf}-temos-backup-${id}"
    fi
    ln -sf ${tmux_config}/dot_tmux "${tmux_conf}"
    echo "Activated: ${tmux_conf}"
} && activate