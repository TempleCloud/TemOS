#!/bin/bash

# Export TEMOS_HOME. This should be the 'temos' directory.
export TEMOS_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Export TEMOS_BIN. Create directory if it does not exist.
export TEMOS_BIN="${TEMOS_HOME}/bin"
if [ ! -d "${TEMOS_BIN}" ]; then
    echo "temos 'bin' directory does not exist. Creating ${TEMOS_BIN}."
    mkdir -p "${TEMOS_BIN}"
fi

# Export TEMOS_BIN. Create directory if it does not exist.
export TEMOS_SCRIPT="${TEMOS_HOME}/script"
source $TEMOS_SCRIPT/proxy.sh
