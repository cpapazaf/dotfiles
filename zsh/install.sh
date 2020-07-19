#!/bin/sh

function is_osx() {
  [[ "$OSTYPE" =~ ^darwin ]] || return 1
}
function is_ubuntu() {
  [[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1
}

function e_header() { echo -e "\n\033[1m$@\033[0m"; }

function install_zsh() {
  e_header "Installing ZSH/oh-my-zsh"
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

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  e_header "Installing Plugins"
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
  wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O ~/.zsh/z.sh

  # Set the default shell to zsh
  if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
    chsh -s $(which zsh)
  fi

  # fix permissions
  compaudit | xargs chmod g-w,o-w
}

e_header "Install/Update zsh/oh-my-zsh (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
  install_zsh
fi

e_header "Configure zsh/oh-my-zsh (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
  e_header "Configuring ZSH"
  rm -rf ~/.zshrc
  echo "export ZSH_DISABLE_COMPFIX=true" >> ~/.zshrc
  cat ~/.oh-my-zsh/templates/zshrc.zsh-template >> ~/.zshrc
  cat ./zsh/append_to_zshrc >> ~/.zshrc
fi