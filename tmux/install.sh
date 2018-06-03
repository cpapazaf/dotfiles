#!/bin/sh

function e_header() { echo -e "\n\033[1m$@\033[0m"; }

function is_osx() {
  [[ "$OSTYPE" =~ ^darwin ]] || return 1
}
function is_ubuntu() {
  [[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1
}

if [[ ! "$(type -P tmux)" ]] ; then
  e_header "Installing tmux"
  if is_ubuntu ; then
    sudo apt-get -qq install tmux
  fi

  if is_osx; then
    brew install \
      tmux \
      reattach-to-user-namespace
  fi
fi

e_header "Configuring tmux"
cp ./tmux/.tmux.conf ~
mkdir -p ~/.tmux/
cp ./tmux/.tmux/* ~/.tmux/

if is_osx ; then
  # appends the osx specific conf
  cat ./osx_tmux_additional_conf.conf >> ~/.tmux.conf
fi
