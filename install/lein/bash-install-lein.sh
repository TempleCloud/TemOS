#!/bin/bash

function install() {
    curl -O https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
    chmod a+x lein
    mv lein $TEMOS_BIN/lein
} && install