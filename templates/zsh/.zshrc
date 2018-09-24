## ZSH Initialization
export ZSH=$HOME/.oh-my-zsh
export PATH="$(python -m site --user-base)/bin:${PATH}"

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

## NVM Autorun
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" != "N/A" ] && [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version system)" ]; then
    nvm use system
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

## Spaceship settings
SPACESHIP_PACKAGE_SHOW=false
