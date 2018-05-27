#!/bin/bash

ID=$(date +"%Y-%m#%d%H:%M:%S")
BASH_CONFIG="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Link .profile file.
PROFILE=${HOME}/.profile
if [ -f "${PROFILE}" ] && [ ! -h "${PROFILE}" ]; then
    mv "${PROFILE}" "${PROFILE}-temos-backup-${ID}"
fi
ln -sf ${BASH_CONFIG}/dot_profile "${PROFILE}"
echo "Activated: ${PROFILE}"

# Link .bash_profile file.
BASH_PROFILE=${HOME}/.bash_profile
if [ -f "${BASH_PROFILE}" ] && [ ! -h "${BASH_PROFILE}" ]; then
    mv "${BASH_PROFILE}" "${BASH_PROFILE}-temos-backup-${ID}"
fi
ln -sf ${BASH_CONFIG}/dot_bash_profile "${BASH_PROFILE}"
echo "Activated: ${BASH_PROFILE}"

# Link .bashrc file.
BASHRC=${HOME}/.bashrc
if [ -f "${BASHRC}" ] &&  [ ! -h "${BASHRC}" ]; then
    mv "${BASHRC}" "${BASHRC}-temos-backup-${ID}"
fi
ln -sf ${BASH_CONFIG}/dot_bashrc "${BASHRC}"
echo "Activated: ${BASHRC}"
source "${BASHRC}"
