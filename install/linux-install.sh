#!/bin/bash

function install() {
    local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    local temos=$(dirname $dir)

    # activate bash dotfile
    "${temos}"/dotfiles/bash/activate-bash.sh
    
    # insta;; curl and wget
    "${temos}"/install/curl/apt-install-curl.sh
    "${temos}"/install/wget/apt-install-wget.sh

    # install powerline fonts
    "${temos}"/install/powerline/apt-pip-install-powerline.sh
    "${temos}"/install/powerline/linux-install-powerline-fonts.sh

    # install exuberant-ctags
    "${temos}"/install/ctags/apt-install-ctags.sh

    # install vim and activate dotfiles
    "${temos}"/install/vim/apt-install-vim.sh
    "${temos}"/dotfiles/vim8/activate-minpac-vim.sh

    # install tmux and activate dotfiles    
    "${temos}"/install/tmux/apt-git-make-install-tmux.sh
    "${temos}"/dotfiles/tmux/activate-tmux.sh

    # install tmux and activate dotfiles
    "${temos}"/install/fzf/git-install-fzf.sh
    "${temos}"/dotfiles/fzf/activate-fzf.sh

    # install ag and activate dotfiles
    "${temos}"/install/the-silver-searcher/apt-install-the-silver-searcher.sh
    "${temos}"/dotfiles/ag/dot_agignore.sh

    # install golang, java
    "${temos}"/install/golang/linux-install-golang-sdk.sh
    "${temos}"/install/java/apt-install-openjdk.sh

    # install docker
    "${temos}"/install/docker/apt-install-docker-ce.sh

    # install cfssl
    "${temos}"/install/cfssl/linux-install-cfssl.sh

    # install gcloud
    "${temos}"/install/gcloud-sdk/apt-install-gcloud-sdk.sh

    # install kubectl
    "${temos}"/install/kubectl/apt-install-kubectl.sh

    # install hugo and memoria
    "${temos}"/install/hugo/apt-install-hugo.sh
    "${temos}"/install/memoria/git-install-memoria.sh

    # install vscode
    "${temos}"/install/vscode/apt-install-vscode.sh
    
    # install nginx
    # "${temos}"/install/nginx/git-install-nginx.sh


} && install

