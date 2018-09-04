#!/bin/bash

# Watch some resource value in a loop. 
# 
# e.g. watch cat /tmp/metrics.json
# e.g. watch date
function watch() {
    local fn=$*
    clear && while true; do ${fn}; sleep 1; clear; done
}

$*