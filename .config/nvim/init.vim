if has('filetype')
  filetype indent plugin on
endif

if has('syntax')
  syntax on
endif

syntax on

nnoremap ; :

set ic
set ruler
set tabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest,full
set cursorline
set gdefault
set backspace=indent,eol,start
set noswapfile
set number
set splitbelow
set splitright
set clipboard=unnamed
set ttyfast

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Enable undo after closing files, but keep the files away from VCSs
set undofile
set undodir=~/.vim-undo

set laststatus=2
set statusline=%f\ %y\ %=%l,%c

let mapleader = ","

" packer stuff
" install with: git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.config/nvim/pack/packer/start/packer.nvim

lua require('plugins')

highlight Normal ctermbg=black
colorscheme dracula
