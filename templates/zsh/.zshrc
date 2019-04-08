## ZSH Init
export ZSH=$HOME/.oh-my-zsh
export PATH="$(python -m site --user-base)/bin:${PATH}"
export LANG="en_GB"

## User
DEFAULT_USER=`whoami` 

## Theme
#ZSH_THEME="agnoster"

## Plugins
plugins=(git node )
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/etc/zsh-kubectl-prompt/kubectl.zsh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

#Startup
source $ZSH/oh-my-zsh.sh

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

## Prompt setup
autoload -U promptinit; promptinit
prompt pure

RPROMPT='%{$fg[yellow]%}$ZSH_KUBECTL_PROMPT%{$reset_color%}'


## Agnoster overrides
#prompt_dir() {
#	prompt_segment blue $CURRENT_FG $(basename `pwd`)
#}
#
#prompt_kubecontext() {
#	prompt_segment red $CURRENT_FG "⎈ `kubectl config current-context`"
#}

#build_prompt() {
#	prompt_status
#	prompt_context
#	prompt_virtualenv
#	prompt_dir
#	prompt_git
#	prompt_kubecontext
#	prompt_end
#}