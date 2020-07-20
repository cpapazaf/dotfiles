#!/bin/bash

function e_header() { echo -e "\n\033[1m$@\033[0m"; }

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

current_fullname=$(git config user.name)
current_email=$(git config user.email)
current_dev_name=$(/usr/libexec/PlistBuddy -c "Print :System:Network:HostNames:LocalHostName" /Library/Preferences/SystemConfiguration/preferences.plist)

# gather important info
read -p "[GIT] Enter fullname [$current_fullname]: " fullname
read -p "[GIT] Enter email [$current_email]: " gitmail
read -p "[System] Device name [$current_dev_name]: " devicename
echo "Verify:"
echo "[GIT] fullname: ${fullname:=$current_fullname}"
echo "[GIT] email: ${gitmail:=$current_email}"
echo "[System] Device name: ${devicename:=$current_dev_name}"
read -p "Continue? (y/n): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

export FULLNAME="$fullname"
export GITMAIL="$gitmail"
export DEVICENAME="$devicename"

if is_osx; then
  which -s brew
  if [[ $? != 0 ]] ; then
    e_header "install brew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi

  # Make sure we’re using the latest Homebrew.
  brew update

  # Upgrade any already-installed formulae.
  brew upgrade

  e_header "Configure osx (y/n)? "
  read answer
  if [ "$answer" != "${answer#[Yy]}" ] ;then
    e_header "Configuring osx"
    ./osx/init.sh
  fi

  e_header "Install formulae (y/n)? "
  read answer2
  if [ "$answer2" != "${answer2#[Yy]}" ] ;then
    e_header "Installing formulae"
    source ./osx/formulae_installer.sh
    install_formulae
  fi
fi

if is_ubuntu_desktop; then
  e_header "Ubuntu OS Config"
  source ./ubuntu/package_installer.sh
  install_packages
fi

e_header "Configure Packages (y/n)? "
read answer3
if [ "$answer3" != "${answer3#[Yy]}" ] ;then
  e_header "Configuring Packages"
  source ./configure.sh
  configure_packages
fi
