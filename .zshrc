export _JAVA_AWT_WM_NONREPARENTING=1
export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

setopt histignorealldups sharehistory

bindkey -e

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

autoload -Uz compinit
compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

plugins=(
		git
		zsh-autosuggestions
		zsh-syntax-highlighting
		sudo
)

# fzf improvement Credits to Savit4r
function fzf-lovely(){

	if [ "$1" = "h" ]; then
		fzf -m --reverse --preview-window down:20 --preview '[[ $(file --mime {}) =~ binary ]] &&
 	                echo {} is a binary file ||
	                 (bat --style=numbers --color=always {} ||
	                  highlight -O ansi -l {} ||
	                  coderay {} ||
	                  rougify {} ||
	                  cat {}) 2> /dev/null | head -500'

	else
	        fzf -m --preview '[[ $(file --mime {}) =~ binary ]] &&
	                         echo {} is a binary file ||
	                         (bat --style=numbers --color=always {} ||
	                          highlight -O ansi -l {} ||
	                          coderay {} ||
	                          rougify {} ||
	                          cat {}) 2> /dev/null | head -500'
	fi
}

function rmk(){
	scrub -p dod $1
	shred -zun 10 -v $1
}

source $ZSH/oh-my-zsh.sh

alias zshconfig="code ~/.zshrc"
alias la="lsd -a --group-dirs=first"
alias ls='lsd --group-dirs=first'

eval "$(starship init zsh)"

export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

# PYWAL
(cat ~/.cache/wal/sequences &)
cat ~/.cache/wal/sequences

export PATH=~/.npm-global/bin:$PATH
