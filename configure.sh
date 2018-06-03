#!/bin/bash

function configure_packages {
    sudo -v

    echo "Installs Git and Gitconfig"
    source ./git/install.sh
    cp ./git/.gitconfig ~/.gitconfig

    echo "Installing .alias"
    cp ./alias/.alias ~/.alias

    echo "Installing bash_conf"
    cp ./shell/.bash_config ~/.bash_config

    echo "Installs Vim and vimrc"
    source ./vim/install.sh
    cp vim/.vimrc ~/.vimrc

    echo "Install Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    if [[ ! "$(type -P git)" ]] ; then
        ret=`python -c 'import sys; print("%i" % (sys.hexversion<0x03000000))'`
        if [ $ret -eq 0 ] ;then
          echo "we require python version <3"
          exit 111
        else
          echo "python version is <3. Installing pip"
          curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
          sudo python get-pip.py
          rm get-pip.py
        fi

        sudo pip install virtualenv virtualenvwrapper
    fi

    echo "Installing Tmux"
    source ./tmux/install.sh

    echo "Installing and starting zsh"
    source ./zsh/install.sh

    echo "Sourcing the new zshrc"
    source ~/.zshrc

}
