export _JAVA_AWT_WM_NONREPARENTING=1
export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

autoload -Uz compinit
compinit

plugins=(
		git
		zsh-autosuggestions
		zsh-syntax-highlighting
		sudo
)

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
