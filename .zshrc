let mapleader=" "

set autoident expandtab tabstop=4 shiftwidth=4
set number relativenumber
set nohlsearch
set ideajoin
set showmode ideastatusicon=enabled

set visualbell noerrorbells

nmap g] <Action>(FindUsages)
nmap <C-]> <Action>(GotoImplementation)

nmap <C-/> <Action>(CommentByLineComment)

nmap <leader>lf <Action>(ReformatCode)
nmap <leader>lr <Action>(RenameElement)
nmap <leader>la <Action>(ShowIntentionActions)

nmap <leader>f <Action>(GotoFile)

nmap H <Action>(PreviousTab)
nmap L <Action>(NextTab)

map <C-k> <Action>(ParameterInfo)

nmap <A-j> :m+1<cr>
nmap <A-k> :m-2<cr>
imap <A-j> <esc>V:m+1<cr>i
imap <A-k> <esc>V:m-2<cr>i
vmap <A-j> :m'>+1<cr>gv=gv
vmap <A-k> :m'<-2<cr>gv=gv

nmap S "_diwP
nmap S "_diwP

nmap <leader>so :source ~/.ideavimrc<cr>

nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y
vnoremap <leader>Y "+Y

nmap <leader>w :w<cr>

nmap Q :q!<cr>

nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap J mzJ`z

set easymotion
set NERDTree
set surround
set exchange
set argtextobj
set textobj-entire
set vim-paragraph-motion
set highlightedyank

nmap s <Plug>(easymotion-s2)

nmap <leader>e :NERDTreeFocus<cr>
nmap <leader>nx :NERDTreeClose<cr>

nmap ae <Plug>(textobj-entire-a)
nmap ie <Plug>(textobj-entire-i)

nmap cx <Plug>(Exchange)
xmap X <Plug>(Exchange)
nmap cxc <Plug>(ExchangeClear)
nmap cxx <Plug>(ExchangeLine)
