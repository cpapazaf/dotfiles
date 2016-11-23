
source ./zsh/install.sh
cp ./zsh/.zshrc ~

source ./tmux/install.sh
cp ./tmux/.tmux.conf ~
mkdir -p ~/.tmux/
cp ./tmux/.tmux/* ~/.tmux/
