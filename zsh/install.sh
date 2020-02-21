#!/bin/sh

function is_osx() {
  [[ "$OSTYPE" =~ ^darwin ]] || return 1
}
function is_ubuntu() {
  [[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1
}

function e_header() { echo -e "\n\033[1m$@\033[0m"; }

if [[ ! "$(type -P zsh)" ]] ; then
  e_header "Installing ZSH"
  if is_ubuntu ; then
    #sudo sh -c "echo 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-completions/xUbuntu_17.10/ /' > /etc/apt/sources.list.d/shells:zsh-users:zsh-completions.list"
    #sudo apt-get update
    # zsh-completions
    sudo apt-get -qq install zsh

  fi

  if is_osx ; then
      brew install \
        zsh \
        zsh-completions
  fi

  # Install Oh My Zsh if it isn't already there
  if [[ ! -d ~/.oh-my-zsh/ ]]; then
    oh=`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
  fi

  # Set the default shell to zsh
  if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
    chsh -s $(which zsh)
  fi
fi

e_header "Installing Plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
echo "source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O ~/.zsh/z.sh
echo "source ~/.zsh/z.sh" >> ~/.zshrc

e_header "Configuring ZSH"
# fixing the zshrc file
cat ./zsh/append_to_zshrc >> ~/.zshrc
