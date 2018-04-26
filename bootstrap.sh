echo "install brew and packages"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install `wget` with IRI support.
brew install wget --with-iri
# Install GnuPG to enable PGP-signing commits.
brew install gnupg
#bindutils
brew install binutils
# install required brew packs
brew install Caskroom/cask/iterm2 fzf
brew install git
brew install git-lfs
brew install tree

echo "Gitconfig"
cp ./git/.gitconfig ~/.gitconfig

echo "Installing .alias"
cp ./alias/.alias ~/.alias

echo "Installing bash_conf"
cp ./shell/.bash_config ~/.bash_config

echo "Installing Tmux"
source ./tmux/install.sh

echo "Configuring tmux"
cp ./tmux/.tmux.conf ~
mkdir -p ~/.tmux/
cp ./tmux/.tmux/* ~/.tmux/

echo "Installing and starting zsh"
source ./zsh/install.sh

echo "Sourcing the new zshrc"
source ~/.zshrc

echo "Install Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Place vimrc"
cp vim/.vimrc ~/.vimrc
