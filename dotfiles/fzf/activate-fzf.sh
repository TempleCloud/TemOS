#!/bin/bash
set -e

# Activate fzf profiles.
#
function activate() {
    local id=$(date +"%Y-%m#%d%H:%M:%S")
    local fzf_config="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

    # Link .fzf.bash file.
    local fzf_bash=${HOME}/.fzf.bash
    if [ -f "${fzf_bash}" ] && [ ! -h "${fzf_bash}" ]; then
        mv "${fzf_bash}" "${fzf_bash}-temos-backup-${id}"
    fi
    ln -sf ${fzf_config}/dot_fzf.bash "${fzf_bash}"
    echo "Activated: ${fzf_bash}"

    # Link .fzf.zsh file.
    local fzf_zsh=${HOME}/.fzf.zsh
    if [ -f "${fzf_zsh}" ] && [ ! -h "${fzf_zsh}" ]; then
        mv "${fzf_zsh}" "${fzf_zsh}-temos-backup-${id}"
    fi
    ln -sf ${fzf_config}/dot_fzf.zsh "${fzf_zsh}"
    echo "Activated: ${fzf_zsh}"
} && activate