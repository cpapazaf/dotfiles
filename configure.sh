#!/bin/bash

function e_header() { echo -e "\n\033[1m$@\033[0m"; }

function configure_packages {
    sudo -v

    e_header "Installs Git and Gitconfig"
    source ./git/install.sh
    home_dir=$(eval echo ~$USER)
    temp_file=$(mktemp)
    cp ./git/.gitconfig ${temp_file}
    sed -i.bak "s~USER_HOME_DIR_PATH~$home_dir~g" ${temp_file}
    sed -i.bak "s/GITFULLNAME_PLACEHOLDER/$FULLNAME/g" ${temp_file}
    sed -i.bak "s/GITEMAIL_PLACEHOLDER/$GITMAIL/g" ${temp_file}
    cp ${temp_file} ~/.gitconfig
    rm ${temp_file}
    cp ./git/.gitignore_global ~/.gitignore_global
    git config --global core.excludesfile ~/.gitignore_global

    e_header "Installs .alias"
    temp_alias_file=$(mktemp)
    cp ./alias/.alias ${temp_alias_file}
    sed -i.bak "s~CODE_DIR_PATH~$CODEFOLDER~g" ${temp_alias_file}
    cp ${temp_alias_file} ~/.alias
    rm ${temp_alias_file}

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
