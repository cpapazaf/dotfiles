
source ./zsh/install.sh
cp ./zsh/.zshrc ~
source ~/.zshrc

source ./tmux/install.sh
cp ./tmux/.tmux.conf ~
mkdir ~/.tmux/
cp ./tmux/.tmux/* ~/.tmux/
