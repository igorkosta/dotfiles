set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim

" vim-airline
set laststatus=2
" show git branch in status line
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
set t_Co=256
" molokai
set background=dark
colorscheme molokai
" molokai
set number
syntax on
let g:netrw_liststyle=3
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"set relativenumber
set undofile

set wrap
set textwidth=79
set formatoptions=qrn1
" set colorcolumn=85

" In order for local `eslint` to work you have to install `eslint` globally
" as well `sudo npm eslint -g` - otherwise it won't work
let g:syntastic_javascript_checkers = ['eslint'] "Use eslint for syntax checking
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

" Point syntastic checker at locally installed `eslint` if it exists.
" if executable('/node_modules/.bin/eslint')
"    let b:syntastic_javascript_eslint_exec = '/node_modules/.bin/eslint'
"endif

nnoremap ; :

" use 'jj' instead of <ESC>
inoremap jj <ESC>

let mapleader = ","
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>a :Ack
nnoremap <leader>p :CtrlP

autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufWritePre * :%s/\s\+$//e
