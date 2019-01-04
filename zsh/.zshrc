export PYENV_ROOT="$HOME/.pyenv"

export RBENV_ROOT="$HOME/.rbenv"

PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
PATH="$HOME/.cargo/bin:$PATH"
PATH="$PYENV_ROOT/bin:$PATH"

export PATH

fpath=( "$HOME/.dotfiles/zsh/zfunctions" $fpath )

# Use prompt sindresorhus/pure
autoload -U promptinit && promptinit
prompt pure

# Initialize completion system
autoload -U compinit && compinit

# Start menu completion after second consecutive <TAB>
setopt auto_menu

# Enable interactive (cursor-keys) menu
zstyle ':completion:*:*:*:*:*' menu select

# Use completion caching
zstyle ':completion::complete:*' use-cache 1

# Case-insensitive, hypen-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'

HISTFILE=$HOME/.zsh_history

HISTSIZE=10000
SAVEHIST=10000

# History timestamp format yyyy-mm-dd
alias history='fc -il 1'

# Append to, rather than replace, history file
setopt append_history

# Save command timestamp and duration in $HISTFILE
setopt extended_history

setopt hist_expire_dups_first

# Ignore duplicates in command history list
setopt hist_ignore_dups

# Do not save commands beginning with a space in $HISTFILE
setopt hist_ignore_space

# Perform history expansion and reload line into editing buffer before execution
setopt hist_verify

# Imports new commands from $HISTFILE, as well as appends typed commands as though
# ING_APPEND_HISTORY were set
setopt share_history

 if which pyenv > /dev/null; then
	eval "$(pyenv init -)"
	pyenv virtualenvwrapper_lazy
 fi

alias docdel='docker rm $(docker ps --all --quiet --filter status=exited)'

alias ag='ag --path-to-ignore ~/.ignore'

alias g='git'
alias ga='git add'
alias gc='git commit --verbose'
alias gc!='git commit --verbose --amend'
alias gco='git checkout'
alias gst='git status'

take () {
	mkdir -p $1
	cd $1
}

# tree
function t() {
	tree -I '.git|node_modules|vendor|.DS_Store' --dirsfirst --filelimit 15 -L ${1:-3} -aC $2
}

# Source zsh syntax highlighting
if [[ -s /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
	source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Source zsh history substring search
if [[ -s ~/.dotfiles/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh ]]; then
	source ~/.dotfiles/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

	# <UP> to search backwards in history
	bindkey '^[[A' history-substring-search-up
	# <DOWN> to search forwards in history
	bindkey '^[[B' history-substring-search-down
fi
