colorscheme darkblue
syntax on

set autoindent
set background=dark
set backspace=indent,eol,start
set bs=2
set encoding=utf-8
set expandtab
set fileencoding=utf-8
"set foldmethod=manual
"set foldcolumn=2
set hls
set incsearch
set nocompatible
set nonumber
set nowrap
set ruler
set scrolloff=3
set shiftwidth=4
set showmatch
set smartindent
set smarttab
set softtabstop=4
set t_Co=256
set tabstop=4
set textwidth=80
"set title
set wildmenu
"set wrap

" Multi-windowing.  CTRL+[HJKL] to switch windows and maximize
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W><bar>
map <C-L> <C-W>l<C-W><bar>

" Multi-file.  CTRL+[NP] for next/previous file
map <C-P> :prev<CR>
map <C-N> :next<CR>

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
