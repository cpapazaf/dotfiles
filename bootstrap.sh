#!/bin/bash


# OS detection
function is_osx() {
  [[ "$OSTYPE" =~ ^darwin ]] || return 1
}
function is_ubuntu() {
  [[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1
}
function is_ubuntu_desktop() {
  dpkg -l ubuntu-desktop >/dev/null 2>&1 || return 1
}
function get_os() {
  for os in osx ubuntu ubuntu_desktop; do
    is_$os; [[ $? == ${1:-0} ]] && echo $os
  done
}


source ./configure.sh

if is_osx; then
	which -s brew
	if [[ $? != 0 ]] ; then
	    echo "install brew"
	    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi

	# Make sure we’re using the latest Homebrew.
	brew update

	# Upgrade any already-installed formulae.
	brew upgrade

	echo -n "Configure osx (y/n)? "
	read answer
	if [ "$answer" != "${answer#[Yy]}" ] ;then
	    echo "Configuring osx"
	    ./osx/init.sh
	fi

	echo -n "Install formulae (y/n)? "
	read answer2
	if [ "$answer2" != "${answer2#[Yy]}" ] ;then
	    echo "Installing formulae"
	    source ./osx/formulae_installer.sh
	    install_formulae
	fi
fi

if is_ubuntu_desktop; then
 echo "Ubuntu OS Config"
fi

echo -n "Configure Packages (y/n)? "
read answer3
if [ "$answer3" != "${answer3#[Yy]}" ] ;then
    echo "Configuring Packages"
    configure_packages
fi
