#!/bin/bash

DEFAULT_HTTP_PROXY="http://www-proxy-ukc1.uk.oracle.com:80"
DEFAULT_HTTPS_PROXY="${DEFAULT_HTTP_PROXY}"
DEFAULT_FTP_PROXY="${DEFAULT_HTTP_PROXY}"
DEFAULT_RSYNC_PROXY="${DEFAULT_HTTP_PROXY}"

# enable the default or specified proxy
function proxy-on() {
    local proxy=${DEFAULT_HTTP_PROXY}
    if [[ ! -z "$1" ]]; then
        proxy=$1
    fi
    export HTTPS_PROXY=${proxy}
    export HTTP_PROXY=${proxy}
    export http_proxy=${proxy}
    export https_proxy=${proxy}
    export ftp_proxy=${proxy}
    export rsync_proxy=${proxy}
}

# disable the terminal proxies
function proxy-off() {
    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset rsync_proxy
}

alias proxy-list="env | grep proxy | sort"