colorscheme darkblue
set nocompatible
set bs=2
set background=dark
set wrap
syntax on
set ruler
set nonumber
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set showmatch
set hls
set incsearch
set wildmenu
set nowrap
set textwidth=80
set encoding=utf-8
set fileencoding=utf-8

set ai
set si
set smarttab

"set foldmethod=manual
"set foldcolumn=2

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W><bar>
map <C-L> <C-W>l<C-W><bar>

map <Leader>hon :%!xxd<CR>
map <Leader>hof :%!xxd -r<CR>

map <C-P> :prev<CR>
map <C-N> :next<CR>

imap <F1> <esc>

" Map F5 to clear the highlighting search
map <F5> :set hls!<bar>set hls?<CR>

" PHP Syntax check
" map <f9> :w<CR>:!php -l %<CR>

" Strip trailing whitespace
"autocmd FileType js,php,py,thtml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

filetype plugin indent on

augroup blah
    au!
    au BufRead,BufNewFile *.html setfiletype php
    au BufRead,BufNewFile *.thtml setfiletype php
    au BufRead,BufNewFile *.module setfiletype php
    au BufRead,BufNewFile *.install setfiletype php
    au BufRead,BufNewFile *.profile setfiletype php

    " For some reason the autocmd overrides above don't work, so f you virata
    autocmd FileType virata set filetype=php

    " Let html files have long lines
    autocmd FileType php set textwidth=0
    autocmd FileType html set textwidth=0
    autocmd FileType thtml set textwidth=0
    autocmd FileType python set textwidth=0

    autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
    autocmd FileType kid setlocal tabstop=4 shiftwidth=4 softtabstop=4
    autocmd FileType html setlocal textwidth=0 tabstop=2 shiftwidth=2 softtabstop=2
augroup END
