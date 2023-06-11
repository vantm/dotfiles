set autoindent expandtab tabstop=4 shiftwidth=4 softtabstop=4

set number
set relativenumber

set nowrap
set encoding=UTF-8

set mouse=a

set cursorline

set hlsearch

set ignorecase
set smartcase

set showmatch

let mapleader=' '

syntax on

inoremap <C-BS> <C-W>

nnoremap S "_diwP

nnoremap <H> :bp<CR>
nnoremap <L> :bn<CR>

nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>

nnoremap <leader>c :bp<CR>:bd #<CR>
nnoremap <leader>/ :noh<CR>

let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"

" automatical strip trailing spaces
autocmd BufWritePre * :%s/\s\+$//e