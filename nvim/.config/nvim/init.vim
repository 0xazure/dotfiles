set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" always use the clipboard instead of nvim registers
set clipboard+=unnamedplus

source ~/.vimrc
