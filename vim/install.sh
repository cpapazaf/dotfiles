#!/bin/sh

function e_header() { echo -e "\n\033[1m$@\033[0m"; }

function is_ubuntu() {
  [[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1
}

if [[ ! "$(type -P vim)" ]] && is_ubuntu; then
  e_header "Installing VIM"
  sudo apt-get -qq install vim 
fi
