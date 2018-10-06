#!/bin/bash

# export HTTPS_PROXY=http://www-proxy-hqdc.us.oracle.com:80
# export HTTP_PROXY=http://www-proxy-hqdc.us.oracle.com:80
# export NO_PROXY=localhost,127.0.0.1,.us.oracle.com,.oraclecorp.com,/var/run/docker.sock,.grungy.us
# export ht

tp_proxy=http://www-proxy-hqdc.us.oracle.com:80
# export https_proxy=http://www-proxy-hqdc.us.oracle.com:80
# export no_proxy=localhost,127.0.0.1,.us.oracle.com,.oraclecorp.com,/var/run/docker.sock,.grungy.us

DEFAULT_HTTP_PROXY="http://www-proxy-ukc1.uk.oracle.com:80"
DEFAULT_HTTPS_PROXY="${DEFAULT_HTTP_PROXY}"
DEFAULT_NO_PROXY="localhost,127.0.0.1,.us.oracle.com,.oraclecorp.com,/var/run/docker.sock,.grungy.us"
DEFAULT_FTP_PROXY="${DEFAULT_HTTP_PROXY}"
DEFAULT_RSYNC_PROXY="${DEFAULT_HTTP_PROXY}"


# enable the default or specified proxy
function proxy-on() {
    local proxy=${DEFAULT_HTTP_PROXY}
    if [[ ! -z "$1" ]]; then
        proxy=$1
    fi
    export HTTP_PROXY=${proxy}
    export HTTPS_PROXY=${proxy}
    export NO_PROXY=${DEFAULT_NO_PROXY} 
    export http_proxy=${proxy}
    export https_proxy=${proxy}
    export ftp_proxy=${proxy}
    export rsync_proxy=${proxy}
}

# disable the terminal proxies
function proxy-off() {
    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset NO_PROXY
    unset http_proxy
    unset https_proxy
    unset no_proxy
    unset ftp_proxy
    unset rsync_proxy
}

function proxy-help() {
    echo "Bristol: http://www-proxy-hqdc.us.oracle.com:80"
    echo "HQ     : http://www-proxy-ukc1.uk.oracle.com:80"
}

alias proxy-list="env | grep proxy | sort"
