# Path to .dotfiles
export DOT=$HOME/.dotfiles

# Path to oh-my-zsh installation
export ZSH=$DOT/zsh/oh-my-zsh

# Path to custom oh-my-zsh tweaks
ZSH_CUSTOM=$DOT/zsh/custom

# PATH configuration
export PATH=$DOT/bin:$HOME/.rbenv/bin:/usr/local/bin:$PATH

# Use coreutils instead of systemutils
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH

# Use coreutils manfiles instead of system manfiles
export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH

# Set language environment
export LANG=en_CA.UTF-8

# Set the default editor
export EDITOR=vim
export VISUAL=vim

# nvm config
export NVM_DIR=$HOME/.nvm
