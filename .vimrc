" pathogen
execute pathogen#infect()
filetype plugin indent on

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

nnoremap ; :

" use 'jj' instead of <ESC>
inoremap jj <ESC>

let mapleader = ","
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>a :Ack
nnoremap <leader>p :CtrlP

autocmd BufNewFile,BufRead *.json set ft=javascript

