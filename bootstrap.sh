echo "install brew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "install curl and wget"
brew install curl wget

echo "Installing .alias"
cp ./alias/.alias ~/.alias

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
