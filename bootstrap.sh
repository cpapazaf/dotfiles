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
