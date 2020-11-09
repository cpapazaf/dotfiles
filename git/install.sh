#!/bin/sh

function e_header() { echo -e "\n\033[1m$@\033[0m"; }

function is_ubuntu() {
  [[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1
}

# for osx see the formulae installer
if is_ubuntu && [[ ! "$(type -P git)" ]] ; then
  e_header "Installing Git"
  sudo apt-get -qq install git-core
fi
