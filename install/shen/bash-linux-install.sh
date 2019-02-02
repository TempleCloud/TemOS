#!/bin/bash

# http://www.shenlanguage.org/

# https://github.com/Shen-Language
# https://github.com/Shen-Language/shen-cl
# https://github.com/Shen-Language/shen-cl/releases

# https://shen-language.github.io/
# https://github.com/Shen-Language/shen-sources/blob/master/doc/porting.md
# https://github.com/Shen-Language/shen-sources


function install() {
    # Download.
    curl -LO https://github.com/Shen-Language/shen-cl/releases/download/v2.3.0/shen-cl-v2.3.0-linux-prebuilt.tar.gz
    # Install.
    tar -zxvf shen-cl-v2.3.0-linux-prebuilt.tar.gz
    if [ -z "${TEMOS_BIN}" ]; then
        echo "error: TEMOS_HOME not set."
        exit 1
    fi
    mv shen "${TEMOS_BIN}"/shen
    # Clean.
    rm shen-cl-v2.3.0-linux-prebuilt.tar.gz
    rm LICENSE.txt
} && install