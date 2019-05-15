" vim:foldmethod=marker:foldlevel=0:foldenable

"
" 0xazure's .vimrc
"

" Plugins (vim-plug.vim) {{{
call plug#begin('~/.vim/plugged')

" General Plugins {{{
" Open file under cursor
Plug 'amix/open_file_under_cursor.vim'

" Show git diff in gutter
Plug 'airblade/vim-gitgutter'

" Change the working directory to the project root
Plug 'airblade/vim-rooter'

" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'

" EditorConfig plugin
Plug 'editorconfig/editorconfig-vim'

if executable('fzf')
  " Fuzzy finder
  Plug '/usr/local/opt/fzf'

  " Vim bindings to fzf
  Plug 'junegunn/fzf.vim'
endif

" Front-end tag completion
Plug 'mattn/emmet-vim'

" Visually select increasingly larger regions of text
Plug 'terryma/vim-expand-region'

" Block comment/uncomment
Plug 'tpope/vim-commentary'

" Asynchronous completion framework for neovim/Vim8
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'

  " Dependencies for Vim8
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Statusline
Plug 'vim-airline/vim-airline'

" Statusline themes
Plug 'vim-airline/vim-airline-themes'

" Syntax checking
Plug 'vim-syntastic/syntastic'

" Indentation guides
Plug 'Yggdroot/indentLine'
" }}}

" Colour schemes {{{
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
"                         │            │      └─ Repo subdirectory
"                         │            └──────── Add to runtime path
"                         └───────────────────── Colourscheme
" }}}

" Language-enhancing Plugins {{{
" Rust code completion utility
Plug 'racer-rust/vim-racer'

" Official Rust plugin
Plug 'rust-lang/rust.vim'

" A solid general language pack
Plug 'sheerun/vim-polyglot'
" }}}

call plug#end()
" }}}

" General Config {{{
" Be iMproved
set nocompatible

if has('autocmd')
    filetype plugin indent on
"               │     │    └──── Enable file type detection
"               │     └───────── Enable loading of indent file
"               └─────────────── Enable loading of plugin files
endif

" Automatically reload changes from outside vim
set autoread

" Enable smoother redawing
set ttyfast

" Enable visual autocomplete for comand palette
set wildmenu
" Make autocomplete behave like shell completion
set wildmode=list:longest

" Intelligent case-sensitive search settings
set ignorecase
set smartcase

" Sane buffer management
set hidden

" More natural pane splitting
set splitright
set splitbelow

" Enable modelines
set modeline
" # of lines to search for modeline
set modelines=2

" Shorten mapping delays
set timeoutlen=1000
" Eliminate key code delays
set ttimeoutlen=0

" Yank and paste from system clipboard
set clipboard=unnamed
" }}}

" UI Config {{{
" Show line numbers
set ruler
" Display absolute line number at cursor
set number
" Use relative line numbering
set relativenumber

" Display incomplete commands
set showcmd

" Enable syntax highlighting
syntax enable
" Limit syntax highlighting
" This avoids very slow redrawing when files contain long lines
set synmaxcol=2500

" Highlight current line
set cursorline
" Highlight certain column(s)
set colorcolumn=81

" Disable beeping and window flashing
" http://vim.wikia.com/wiki/Disable_beeping
set visualbell
set noerrorbells
set t_vb=

" Enable searching while typing
set incsearch
" Highlight all search matches
set hlsearch

" Fold based on indent
set foldmethod=indent
" Deepest fold is 3 levels
set foldnestmax=3
" Don't fold by default
set nofoldenable

" Display invisible characters
set list listchars=tab:——,eol:¬,trail:·

" Enable full-colour support
set t_Co=256

" Use dark colour schemes
set background=dark
" Set colour scheme
silent! colorscheme Tomorrow-Night
" }}}

" Plugin Configuration {{{

" plugin:airblade/vim-gitgutter {{{
" Always show sign column
if exists('&signcolumn')  " Vim >7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif
" }}}

" plugin:christoomey/vim-tmux-navigator {{{
" Execute `update` on leaving vim for a tmux pane
let g:tmux_navigator_save_on_switch = 1
" }}}

" plugin:junegunn/fzf.vim {{{
" Set fzf window height
let g:fzf_layout = { 'down': '~20%' }
" }}}

" plugin:racer-rust/vim-racer {{{
" Show fuction signatures in autocompletion
let g:racer_experimental_completer = 1
" }}}

" plugin:rust-lang/rust.vim {{{
" Automatically format rust files on save (if `rustfmt` is available)
let g:rustfmt_autosave = 1
" }}}

" plugin:sheerun/vim-polyglot {{{
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:polyglot_disabled = ['rust']
" }}}

" plugin:shougo/deoplete.nvim {{{
let g:deoplete#enable_at_startup = 1
" }}}

" plugin:vim-airline/vim-airline {{{
" Fix vim-airline not appearing
set laststatus=2

" Show buffer index
let g:airline#extensions#tabline#buffer_idx_mode = 1

" Use algo optimized for tabs for indentation and spaces for alignment
" See :help airline-whitespace
let g:airline#extensions#whitespace#mixed_indent_algo = 2
" }}}

" plugin:vim-syntastic/syntastic {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Configure symbols & colours
let g:syntastic_error_symbol = '✘'
highlight SyntasticErrorSign ctermbg=none ctermfg=red
let g:syntastic_warning_symbol = "▲"
highlight SyntasticWarningSign ctermbg=none ctermfg=yellow
" }}}

" }}}

" File Encoding {{{
" Use UTF-8 as default encoding
set encoding=utf8
" Use Unix as the default file type
set ffs=unix,dos,mac
" }}}

" History & Undo {{{
" Enable persistent undo
set undofile
" Increase command history
set history=5000
" Increase undo levels
set undolevels=1000
" Number of lines to save for undo
set undoreload=10000

" Create undodir if it does not exist
let s:my_undodir = expand("~/.vim/undo")
if !isdirectory(s:my_undodir)
  call mkdir(s:my_undodir, "p")
endif
" Where to save undo histories
let &undodir = s:my_undodir

" Create backupdir if it does not exist
let s:my_backupdir = expand("~/.vim/backup")
if !isdirectory(s:my_backupdir)
  call mkdir(s:my_backupdir, "p")
endif
" Where to save `*.swp` files
let &backupdir = s:my_backupdir
let &directory = s:my_backupdir

" Don't create backups for certain files
set backupskip=/tmp/*
set backupskip+=/private/tmp/*
" }}}

" Indentation {{{
" Retain indentation on next line
set autoindent
" }}}

" Keybindings {{{
" Make backspace behave in a sane manner
set backspace=indent,eol,start

" jk smash for ESC
inoremap jk <ESC>
inoremap kj <ESC>

" Better navigation between wrapped lines
" Move by screen line instead of by file line
nmap j gj
nmap k gk
vmap j gj
vmap k gk

" Better command leader
nnoremap ; :

" Better personal leader
let mapleader = "\<space>"

" Leader Commands {{{
" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>
" }}}

" Plugin Keybindings {{{

" plugin:junegunn/fzf.vim {{{
map <C-p> :Files<CR>
nmap <leader>b :Buffers<CR>
" }}}

" plugin:terryma/vim-expand-region {{{
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" }}}

" plugin:vim-airline/vim-airline {{{
" Select buffer corresponding to <leader>#
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" }}}

" }}}

" }}}

" Automatic Commands {{{
" http://learnvimscriptthehardway.stevelosh.com/chapters/14.html
if has('autocmd')

" augroup * {{{
    " Auto-save file when leaving Insert mode
    augroup all_files
        autocmd!
        autocmd InsertLeave * if expand('%') != '' | update | endif
    augroup END

    augroup vert_center_cursor
      autocmd!
      autocmd BufEnter,WinEnter,WinNew,VimResized *,*.*
            \ let &scrolloff = winheight(win_getid()) / 2
    augroup END
" }}}

" augroup gitcommit {{{
    augroup gitcommit
        autocmd!
        " New line after 72 characters in a commit message
        autocmd FileType gitcommit set textwidth=72

        " Also colour the 51st column (for titles - max 50 characters)
        autocmd FileType gitcommit set colorcolumn+=51
    augroup END
" }}}

endif
" }}}

" Load local settings if they exist
if filereadable(glob('~/.vimrc.local'))
    source ~/.vimrc.local
endif
