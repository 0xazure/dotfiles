# Set name of the theme to load
ZSH_THEME="0xazure"

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
git
heroku
rails
)

source $ZSH/oh-my-zsh.sh

# Load aliases
source $DOT/zsh/aliases.zsh
