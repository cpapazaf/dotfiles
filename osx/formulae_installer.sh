#!/bin/bash

function install_formulae {
    # Install GNU core utilities (those that come with macOS are outdated).
    # Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
    brew install coreutils
    # Install some other useful utilities like `sponge`.
    brew install moreutils
    # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
    brew install findutils
    # Install GNU `sed`, overwriting the built-in `sed`.
    brew install gnu-sed
    # Install `wget`
    brew install wget
    # Install GnuPG to enable PGP-signing commits.
    brew install gnupg
    # bindutils
    brew install binutils
    # install required brew packs
    brew install Caskroom/cask/iterm2 fzf
    brew install git
    brew install git-crypt
    brew install git-lfs
    brew install tree
    brew install jq
    brew install pyenv
    brew cask install rectangle
    brew cask install google-chrome
    brew cask install chromedriver
    brew cask install visual-studio-code
    brew cask install keepassxc
}
