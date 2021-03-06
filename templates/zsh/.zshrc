## ZSH Init
export ZSH=$HOME/.oh-my-zsh
export PATH="$(python -m site --user-base)/bin:${PATH}:node_modules/.bin"
export LANG="en_GB"

## User
DEFAULT_USER=`whoami`

## Plugins
plugins=(git node )
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/etc/zsh-kubectl-prompt/kubectl.zsh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

#Startup
source $ZSH/oh-my-zsh.sh

setopt histignorespace

## Source external settings
for f in $HOME/icloud/.zsh/.*
do
	if [ "$f" = "$HOME/icloud/.zsh/.DS_Store" ]; then
		continue;
	fi
	source $f
done


## Prompt setup
autoload -U promptinit; promptinit
prompt pure

RPROMPT='%{$fg[yellow]%}$ZSH_KUBECTL_PROMPT%{$reset_color%}'

#FNM
eval "`fnm env`"

#FNM autoload
autoload -U add-zsh-hook
	_fnm_autoload_hook () {
	  	if [[ -f .node-version && -r .node-version ]]; then
	    	echo "fnm: Found .node-version"
	    	fnm use
	    	rehash
	  	elif [[ -f .nvmrc && -r .nvmrc ]]; then
	    	echo "fnm: Found .nvmrc"
	      	fnm use
	      	rehash
	    else
	    	fnm --log-level quiet use system
	    	rehash
	    fi
	  }

add-zsh-hook chpwd _fnm_autoload_hook && _fnm_autoload_hook
