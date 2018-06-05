#!/bin/bash

function is_osx() {
  [[ "$OSTYPE" =~ ^darwin ]] || return 1
}
function is_ubuntu() {
  [[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1
}

if is_osx ; then
  readonly LOAD=$(sysctl -n vm.loadavg | awk '{ print $2 }')
  readonly NCPU=$(sysctl -n hw.ncpu)

  echo $LOAD/$NCPU
fi

if is_ubuntu ; then

fi
