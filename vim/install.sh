#!/bin/sh

function e_header() { echo -e "\n\033[1m$@\033[0m"; }

function is_ubuntu() {
  [[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1
}

if is_ubuntu && [[ ! "$(type -P vim)" ]] ; then
  e_header "Installs Vim"
  sudo apt-get -qq install vim 
fi

e_header "Configures Vim"
cp vim/.vimrc ~/.vimrc

if [[ ! -d ~/.vim/bundle/Vundle.vim/ ]]; then
  e_header "Installs Vundle"
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
