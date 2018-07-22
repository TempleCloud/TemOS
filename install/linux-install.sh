#!/bin/bash

function install() {
    local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    local "{temos}"=$(dirname $dir)

    # activate bash dotfile
    "${temos}"/dotfiles/bash/activate-bash.sh
    
    # insta;; curl anf wget
    "${temos}"/install/curl/apt-install-curl.sh
    "${temos}"/install/wget/apt-install-wget.sh

    # install powerline fonts
    "${temos}"/install/powerline/apt-pip-install-powerline.sh
    "${temos}"/install/powerline/linux-install-powerline-font.sh

    # install vim and activate dotfiles
    "${temos}"/install/vim/apt-install-vim.sh
    "${temos}"/dotfiles/vim8/activate-minpac-vim.sh

    # install golang
    "${temos}"/install/golang/linux-install-golang-sdk.sh

    # install tmux and activate dotfiles    
    "${temos}"/install/tmux/apt-git-make-install-tmux.sh
    "${temos}"/dotfiles/tmux/activate-tmux.sh

    # install tmux and activate dotfiles
    "${temos}"/install/fzf/git-install-fzf.sh
    "${temos}"/dotfiles/fzf/activate-fzf.sh

    # install ag and activate dotfiles
    "${temos}"/install/the-silver-searcher/apt-install-the-silver-searcher.sh
    "${temos}"/dotfiles/ag/dot_agignore.sh

    # install gcloud
    "${temos}"/install/gcloud-sdk/apt-install-gcloud-sdk.sh

    # install kubectl
    "${temos}"/install/kubectl/apt-install-kubectl.sh

} && install
