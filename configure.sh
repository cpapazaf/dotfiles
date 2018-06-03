#!/bin/bash

function e_header() { echo -e "\n\033[1m$@\033[0m"; }

function configure_packages {
    sudo -v

    e_header "Installs Git and Gitconfig"
    source ./git/install.sh
    cp ./git/.gitconfig ~/.gitconfig

    e_header "Installs .alias"
    cp ./alias/.alias ~/.alias

    e_header "Installs bash_conf"
    cp ./shell/.bash_config ~/.bash_config

    e_header "Installs Vim and vimrc"
    source ./vim/install.sh

    if [[ ! "$(type -P git)" ]] ; then
        ret=`python -c 'import sys; print("%i" % (sys.hexversion<0x03000000))'`
        if [ $ret -eq 0 ] ;then
          echo "we require python version <3"
          exit 111
        else
          e_header "python version is <3. Installing pip"
          curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
          sudo python get-pip.py
          rm get-pip.py
        fi

        sudo pip install virtualenv virtualenvwrapper
    fi

    e_header "Installs Tmux"
    source ./tmux/install.sh

    e_header "Installs ZSH"
    source ./zsh/install.sh
}
