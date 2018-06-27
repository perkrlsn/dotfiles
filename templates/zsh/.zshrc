## ZSH Initialization
export ZSH=$HOME/.oh-my-zsh

## Plugins
plugins=(git node)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

## Source external settings
for f in $HOME/icloud/.zsh/.*
do
  if [ "$f" = "$HOME/icloud/.zsh/.DS_Store" ]; then
    continue;
  fi
  source $f
done

## Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

## Spaceship settings
SPACESHIP_PACKAGE_SHOW=false