#!/bin/bash

function update_repo() {
    local repo_name=$1
    if [ -d "${repo_name}" ]; then
        echo "Updating ${repo_name}..."
        pushd ${repo_name} > /dev/null
        git pull
        popd > /dev/null
    else
        echo "Cloning ${repo_name}..."
        git clone git@github.com:tc-playground/${repo_name}.git
    fi
}

# Core Respositories
update_repo embedded-playground
update_repo os-playground
update_repo linux-playground
update_repo infosec-playground
update_repo nw-playground
update_repo cloud-playground

# Language Repositories
update_repo language-playground
update_repo c-playground
update_repo rust-playground
update_repo java-playground
update_repo erlang-playground
update_repo crafting-interpreters

# General Development
update_repo development-playground
update_repo kubernetes-playground

# Web Repositories
update_repo web-playground
update_repo flutter-playground
update_repo FlutterCasts

# Data Science
update_repo machine-learning-playground

