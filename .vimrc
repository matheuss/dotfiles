let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE . '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' . substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif

set nocompatible
let s:dein_base = '~/.cache/dein/'
let s:dein_src = '~/.cache/dein/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_src
call dein#begin(s:dein_base)
call dein#add(s:dein_src)

call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('tpope/vim-fugitive')
call dein#add('joshdick/onedark.vim')
call dein#add('airblade/vim-gitgutter')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('w0rp/ale')
call dein#add('leafgarland/typescript-vim')
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

call dein#end()

if has('filetype')
  filetype indent plugin on
endif

if has('syntax')
  syntax on
endif

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
set ttyfast

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

let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_go_gofmt_options = '-s'

let g:ale_linters = {
\   'jsx': ['eslint'],
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['prettier'],
\   'go': ['gofmt'],
\   'tf': ['terraform']
\}

let g:ale_fix_on_save = 1

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✔' : printf(
  \   '%dW %dE',
  \   all_non_errors,
  \   all_errors
  \)
endfunction

set laststatus=2
set statusline=%f\ %y\ %=%l,%c
set statusline+=\ [%{LinterStatus()}]

let mapleader = ","

map <Leader>l : ALENext<cr>
