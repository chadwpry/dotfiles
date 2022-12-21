execute pathogen#infect()
syntax on
filetype plugin indent on

" solarized
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme gruvbox

let mapleader=","

nnoremap <silent> ,<space> :nohl<CR>
nnoremap <silent> ,1 :set background=light<CR>
nnoremap <silent> ,2 :set background=dark<CR>
nnoremap <silent> ,3 :colorscheme gruvbox<CR>
nnoremap <silent> ,4 :colorscheme solarized<CR>

set splitright
set splitbelow
set number
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set errorbells
set visualbell
 
set hlsearch
set smartcase
set ignorecase
set incsearch
 
set autoindent
set smartindent
set smarttab
set softtabstop=2

set ruler
 
set undolevels=1000
set backspace=indent,eol,start

set undodir=~/.vim/undo-dir
set undofile

set splitright
set splitbelow

" new
set tabstop=2 shiftwidth=2
set showmatch
set cursorline

:map - <c-o>

" :W sudo saves the file when the file is open in readonly mode
command W w !sudo ree % > /dev/null
