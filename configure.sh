#!/bin/bash

function e_header() { echo -e "\n\033[1m$@\033[0m"; }

function configure_packages {
    sudo -v

    e_header "Installs Git and Gitconfig"
    source ./git/install.sh
    cp ./git/.gitconfig ~/.gitconfig
    cp ./git/.gitignore_global ~/.gitignore_global
    git config --global core.excludesfile ~/.gitignore_global

    e_header "Installs .alias"
    cp ./alias/.alias ~/.alias

    e_header "Installs bash_conf"
    cp ./shell/.bash_config ~/.bash_config

    e_header "Installs Vim and vimrc"
    source ./vim/install.sh

    e_header "Installs Tmux"
    source ./tmux/install.sh

    e_header "Installs ZSH"
    source ./zsh/install.sh

    e_header "Installs Python modules"
    source ./python/install.sh
}
