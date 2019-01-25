syntax on " use syntax highlighting
set nocompatible
colorscheme slate
set background=dark

" Line numberings
" set number
" set relativenumber

" Show position in file
set ruler


" Search Settings
set incsearch
set hlsearch

set showcmd

" Tab specific option
set tabstop=8                   "A tab is 8 spaces
set expandtab                   "Always uses spaces instead of tabs
set softtabstop=4               "Insert 4 spaces when tab is pressed
set shiftwidth=4                "An indent is 4 spaces
set shiftround                  "Round indent to nearest shiftwidth multiple

filetype plugin indent on

" Backspacing options, allow for 'normal' backspacing
set backspace=indent,eol,start

" Line to be highlighted
:set colorcolumn=80

"     _    _     _____ 
"    / \  | |   | ____|
"   / _ \ | |   |  _|  
"  / ___ \| |___| |___ 
" /_/   \_\_____|_____|
                     
let g:ale_lint_delay=1000       " 1 Second delay after typing before linting

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fix_on_save = 1

let g:ale_completion_enabled = 1

" Disable ghc and use stack ghc
" Use rls
let g:ale_linters = {
\   'haskell': ['stack-ghc'],
\   'rust': ['rls'],
\   'python': ['flake8'],
\}

" Prettier settings
let g:ale_javascript_prettier_options = '--print-width 120 --tab-width 4'

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
