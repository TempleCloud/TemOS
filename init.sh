#!/bin/bash

# Export TEMOS_HOME. This should be the 'temos' directory.
export TEMOS_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Export TEMOS_BIN. Create directory if it does not exist.
export TEMOS_BIN="${TEMOS_HOME}/bin"
if [ ! -d "${TEMOS_BIN}" ]; then
    echo "temos 'bin' directory does not exist. Creating ${TEMOS_BIN}."
    mkdir -p "${TEMOS_BIN}"
fi

# Export TEMOS_LIB. Create directory if it does not exist.
export TEMOS_LIB="${TEMOS_HOME}/lib"
if [ ! -d "${TEMOS_LIB}" ]; then
    echo "temos 'bin' directory does not exist. Creating ${TEMOS_LIB}."
    mkdir -p "${TEMOS_LIB}"
fi

# Export TEMOS_SCRIPT. Create directory if it does not exist.
export TEMOS_SCRIPT="${TEMOS_HOME}/script"
source $TEMOS_SCRIPT/proxy.sh

# If present execute work script. This script is not checked in and used for 
# customising machine specific environments.
if [ -f "${TEMOS_SCRIPT}/work.sh" ]; then
    source "${TEMOS_SCRIPT}/work.sh"
fi
