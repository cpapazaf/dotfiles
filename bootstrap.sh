#!/bin/bash

source ./formulae_installer.sh
source ./configure.sh

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
    install_formulae
fi

echo -n "Configure Packages (y/n)? "
read answer3
if [ "$answer3" != "${answer3#[Yy]}" ] ;then
    echo "Configuring Packages"
    configure_packages
fi
