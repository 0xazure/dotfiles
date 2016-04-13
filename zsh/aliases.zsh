# Configuration shortcuts
alias zshconfig="$EDITOR $DOT/zsh/.zshrc"
alias ohmyzsh="$EDITOR $ZSH"
alias dotfiles="$EDITOR $DOT"

# Shell
alias ls='ls -AFG --color=auto --quoting-style=escape'
alias ll='ls -A1'

# Bundler
alias b='bundle'
alias bi='b install --path vendor'
alias bil='bi --local'
alias bu='b update'
alias be='b exec'
alias binit="bi && echo 'vendor/ruby' >> .gitignore"

# Gemrat
alias gemrat='gemrat --no-install'

# tree
function t() {
  tree -I '.git|node_modules|vendor|.DS_Store' --dirsfirst --filelimit 15 -L ${1:-3} -aC $2
}
