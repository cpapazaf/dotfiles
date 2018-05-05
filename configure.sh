#!/bin/bash

function configure_packages {
    sudo -v

    echo "Gitconfig"
    cp ./git/.gitconfig ~/.gitconfig

    echo "Installing .alias"
    cp ./alias/.alias ~/.alias

    echo "Installing bash_conf"
    cp ./shell/.bash_config ~/.bash_config

    echo "Installing Tmux"
    source ./tmux/install.sh

    echo "Configuring tmux"
    cp ./tmux/.tmux.conf ~
    mkdir -p ~/.tmux/
    cp ./tmux/.tmux/* ~/.tmux/

    echo "Installing pip"
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

    echo "Installing and starting zsh"
    source ./zsh/install.sh

    chsh -s $(which zsh)

    echo "Sourcing the new zshrc"
    source ~/.zshrc

    echo "Install Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    echo "Place vimrc"
    cp vim/.vimrc ~/.vimrc
}
