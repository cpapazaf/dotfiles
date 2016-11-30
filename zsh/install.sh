#!/bin/sh

#================= ZSH =============
brew install \
  z \
  zsh \
  zsh-completions \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  zsh-history-substring-search

ZSH = `which zsh`

echo "$ZSH" | sudo tee -a /etc/shells

# We need to be in zsh in order chsh to work properly
zsh

chsh -s $ZSH

