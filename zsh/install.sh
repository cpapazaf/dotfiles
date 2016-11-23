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

chsh -s $ZSH

