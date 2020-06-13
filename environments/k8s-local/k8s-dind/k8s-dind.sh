#!/bin/bash

# https://github.com/kubernetes-sigs/kubeadm-dind-cluster


URL="https://cdn.rawgit.com/kubernetes-sigs/kubeadm-dind-cluster/master/fixed"
NAME="dind-cluster"
VERSION="v1.10"


# 1.8, 1.9 and 1.10
function install() {
    local version=${1:-"${VERSION}"}
    wget "${URL}/${NAME}-${version}.sh"
    chmod +x "${NAME}-${version}.sh"
}

function up() {
    local version=${1:-"${VERSION}"}
    ./"${NAME}-${version}.sh" up
    export PATH="$HOME/.kubeadm-dind-cluster:$PATH"
}

function down() {
    local version=${1:-"${VERSION}"}
    ./"${NAME}-${version}.sh" down
}

function clean() {
    local version=${1:-"${VERSION}"}
    ./"${NAME}-${version}.sh" clean
}

$@


# $ # start the cluster
# $ ./dind-cluster-v1.8.sh up

# $ # add kubectl directory to PATH
# $ export PATH="$HOME/.kubeadm-dind-cluster:$PATH"

# $ kubectl get nodes
# NAME                      STATUS    AGE       VERSION
# kube-master   Ready     6m        v1.8.6
# kube-node-1   Ready     5m        v1.8.6
# kube-node-2   Ready     5m        v1.8.6

# $ # k8s dashboard available at http://localhost:8080/api/v1/namespaces/kube-system/services/kubernetes-dashboard:/proxy

# $ # restart the cluster, this should happen much quicker than initial startup
# $ ./dind-cluster-v1.8.sh up

# $ # stop the cluster
# $ ./dind-cluster-v1.8.sh down

# $ # remove DIND containers and volumes
# $ ./dind-cluster-v1.8.sh clean