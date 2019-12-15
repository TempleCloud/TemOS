#!/bin/bash

function update_repo() {
    local repo_name=$1
    echo "repo_name: ${repo_name}"
    if [[ -d "${repo_name}" ]]; then
        echo "Rebaasing from master: ${repo_name}"
        pushd ${repo_name} > /dev/null
        git fetch -a
        git checkout master
        git rebase master
        popd > /dev/null
    else
        echo "Cloning Repo: ${repo_name}" 
        git clone git@github.com:tc-playground/${repo_name}.git
    fi
}

update_repo embedded-playground
update_repo linux-playground
update_repo infosec-playground
update_repo nw-playground
update_repo web-playground

update_repo development-playground
update_repo cloud-playground
update_repo kubernetes-playground
update_repo machine-learning-playground

update_repo language-playround
update_repo c-playground
update_repo erlang-playground
update_rpeo rust-playground
update_repo java-playground

update_repo flutter-playground

update-repo crafting-interpreters
