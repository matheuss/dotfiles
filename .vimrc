"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/matheus/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/matheus/.vim/bundle')
  call dein#begin('/Users/matheus/.vim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/matheus/.vim/bundle/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('tpope/vim-fugitive')
  call dein#add('scrooloose/syntastic')
  call dein#add('joshdick/onedark.vim')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('ctrlpvim/ctrlp.vim')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

syntax on
colorscheme onedark
highlight Normal ctermbg=black

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

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Enable undo after closing files, but keep the files away from VCSs
set undofile
set undodir=~/.vim-undo

" Automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

" Set syntax highlighting for node shell scripts
au! BufNewFile,BufRead,BufWrite * if getline(1) =~ '^\#!.*node' | setf javascript | endif

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
