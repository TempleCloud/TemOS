#!/bin/bash

# Configure bash profiles. Assumes: .profile < .bash_profile < .bashrc
#
function activate() {
    local id=$(date +"%Y-%m#%d%H:%M:%S")
    local bash_config="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

    # Link .profile file.
    local profile=${HOME}/.profile
    if [ -f "${profile}" ] && [ ! -h "${profile}" ]; then
        mv "${profile}" "${profile}-temos-backup-${id}"
    fi
    ln -sf ${bash_config}/dot_profile "${profile}"
    echo "Activated: ${profile}"

    # Link .bash_profile file.
    local bash_profile=${HOME}/.bash_profile
    if [ -f "${bash_profile}" ] && [ ! -h "${bash_profile}" ]; then
        mv "${bash_profile}" "${bash_profile}-temos-backup-${id}"
    fi
    ln -sf ${bash_config}/dot_bash_profile "${bash_profile}"
    echo "Activated: ${bash_profile}"

    # Link .bashrc file.
    local bashrc=${HOME}/.bashrc
    if [ -f "${bashrc}" ] &&  [ ! -h "${bashrc}" ]; then
        mv "${bashrc}" "${bashrc}-temos-backup-${id}"
    fi
    ln -sf ${bash_config}/dot_bashrc "${bashrc}"
    echo "Activated: ${bashrc}"

    source "${bashrc}"
} && activate