# Set name of the theme to load
ZSH_THEME="pure"

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

source $ZSH/oh-my-zsh.sh

# Ask before executing `rm folder/*`
unsetopt RM_STAR_SILENT

# Load aliases
source $DOT/zsh/aliases.zsh

# Source nvm for Node.js version management
source $HOME/.nvm/nvm.sh

# Source rbenv for ruby version management
eval "$(rbenv init -)"

# Source gvm for go version and GOPATH management
if [[ -s "$HOME/.gvm/scripts/gvm" ]]; then
  source $HOME/.gvm/scripts/gvm
fi

# Source docker-machine for docker in the shell
if [[ $(docker-machine status default | grep 'Running') ]]; then
  eval "$(docker-machine env default)"
fi

# Source shell syntax highlighting
if [[ -s /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
