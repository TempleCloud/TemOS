#!/bin/bash

function update_repo() {
    local org_name=$1
    local repo_name=$2
    if [ -d "${repo_name}" ]; then
        echo "Updating ${repo_name}..."
        pushd ${repo_name} > /dev/null
        git pull
        popd > /dev/null
    else
        echo "Cloning ${org_name}/${repo_name}..."
        git clone git@github.com:${org_name}/${repo_name}.git
    fi
}

function update_tc-playground() {
    local org_name="tc-playground"
    local target_dir=${HOME}/Work/dev/github.com/${org_name}

    mkdir -p ${target_dir}

    pushd ${target_dir} > /dev/null
    
    # Core Respositories
    update_repo ${org_name} embedded-playground
    update_repo ${org_name} os-playground
    update_repo ${org_name} linux-playground
    update_repo ${org_name} infosec-playground
    update_repo ${org_name} nw-playground
    update_repo ${org_name} cloud-playground
    # Language Repositories
    update_repo ${org_name} language-playground
    update_repo ${org_name} c-playground
    update_repo ${org_name} rust-playground
    update_repo ${org_name} java-playground
    update_repo ${org_name} erlang-playground
    update_repo ${org_name} crafting-interpreters
    # General Development
    update_repo ${org_name} development-playground
    update_repo ${org_name} kubernetes-playground
    # Web Repositories
    update_repo ${org_name} web-playground
    update_repo ${org_name} flutter-playground
    update_repo ${org_name} FlutterCasts

    # Data Science
    update_repo ${org_name} machine-learning-playground

    popd > /dev/null
}

update_tc-playground


