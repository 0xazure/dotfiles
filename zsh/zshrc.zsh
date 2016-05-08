# Path to oh-my-zsh installation
export ZSH=$DOT/zsh/oh-my-zsh
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

source $ZSH/oh-my-zsh.sh

# Ask before executing `rm folder/*`
unsetopt RM_STAR_SILENT

# Don't store commands prefixed with a space in history
set HIST_IGNORE_SPACE

# Load aliases
source $DOT/zsh/aliases.zsh

# tmux
## Don't autoset pane title
export DISABLE_AUTO_TITLE=true

# golang
export GOPATH=$HOME/golang
export PATH=$GOPATH/bin:$PATH

# nvm
## Source nvm for Node.js version management
export NVM_DIR=$DOT/nodejs/nvm
source $NVM_DIR/nvm.sh

# Source rbenv for ruby version management
eval "$(rbenv init -)"

# Source docker-machine for docker in the shell
if [[ $(docker-machine status default | grep 'Running') ]]; then
  eval "$(docker-machine env default)"
fi

# Source shell syntax highlighting
if [[ -s /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
