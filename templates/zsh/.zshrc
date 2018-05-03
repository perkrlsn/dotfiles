# ZSH Initialization
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME=wedisagree

plugins=(git node)

source $ZSH/oh-my-zsh.sh

# Source external settings
for f in $HOME/icloud/.zsh/.*
do
  if [ "$f" = "$HOME/icloud/.zsh/.DS_Store" ]; then
    continue;
  fi
  source $f
done