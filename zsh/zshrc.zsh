# Path to oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh
# Path to custom oh-my-zsh tweaks
export ZSH_CUSTOM=$DOT/zsh/custom
# Disable oh-my-zsh auto update
DISABLE_AUTO_UPDATE=true
# Display red dots while waiting for completion
COMPLETION_WAITING_DOTS="true"
# Disable marking untracked files as dirty
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plugins loaded from ~/.oh-my-zsh/plugins/*
plugins=(
brew
brew-cask
docker
docker-compose
git
heroku
rails
tmux
)

# Set name of the prompt theme to load
ZSH_THEME="pure"

# oh-my-zsh
[[ -s $ZSH/oh-my-zsh.sh ]] && . $ZSH/oh-my-zsh.sh

# Load aliases
[[ -s $DOT/zsh/aliases.zsh ]] && . $DOT/zsh/aliases.zsh

# Ask before executing `rm folder/*`
unsetopt RM_STAR_SILENT
# Don't store commands prefixed with a space in history
set HIST_IGNORE_SPACE

# tmux
## Don't autoset pane title
export DISABLE_AUTO_TITLE=true

# golang
export GOPATH=$HOME/golang
mkdir -p $GOPATH
export PATH=$GOPATH/bin:$PATH

# rust
export PATH=$HOME/.cargo/bin:$PATH

# rbenv
eval "$(rbenv init -)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/devel
[[ -s /usr/local/bin/virtualenvwrapper.sh ]] && . /usr/local/bin/virtualenvwrapper.sh

# Source shell syntax highlighting
if [[ -s /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
