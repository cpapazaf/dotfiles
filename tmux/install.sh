#!/bin/sh

function e_header() { echo -e "\n\033[1m$@\033[0m"; }

function is_osx() {
  [[ "$OSTYPE" =~ ^darwin ]] || return 1
}
function is_ubuntu() {
  [[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1
}

e_header "Installs tmux"

if is_ubuntu && [[ ! "$(type -P tmux)" ]] ; then
  sudo apt-get -qq install tmux
fi

if is_osx && [[ ! "$(type tmux)" ]] ; then
  brew install \
    tmux \
    reattach-to-user-namespace
fi

e_header "Configures tmux"
cp ./tmux/.tmux.conf ~
mkdir -p ~/.tmux/
cp ./tmux/.tmux/* ~/.tmux/

if is_osx ; then
  e_header "Appends OSX specific tmux conf"
  cat ./tmux/osx_tmux_additional_conf.conf >> ~/.tmux.conf
fi
