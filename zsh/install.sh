#!/bin/sh

#================= ZSH =============
install_zsh () {
    if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
        # Install Oh My Zsh if it isn't already there
        if [[ ! -d ~/.oh-my-zsh/ ]]; then
          oh=`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
          # fixing the zshrc file
          cat ./zsh/append_to_zshrc >> ~/.zshrc 
        fi
        # Set the default shell to zsh
        if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
          chsh -s $(which zsh)
        fi
    else
        brew install \
          z \
          zsh \
          zsh-completions \
          zsh-autosuggestions \
          zsh-syntax-highlighting \
          zsh-history-substring-search
        install_zsh
    fi
}

install_zsh

