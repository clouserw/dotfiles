let g:solarized_termcolors=256
colorscheme solarized
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
"set t_Co=16
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

" Map F5 to turn on spellcheck
map <F5> :setlocal spell! spelllang=en_us <Bar> hi SpellBad cterm=underline,bold ctermfg=red ctermbg=none<CR>

" Strip trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

""" Python
map <F8> Oimport pdb; pdb.set_trace()<Esc>

" Map Ctrl+W S to opening a new terminal
map <C-W>s :ConqueTerm bash<CR>
let g:ConqueTerm_ReadUnfocused = 0
"let g:ConqueTerm_CWInsert = 0

filetype plugin indent on

au BufRead,BufNewFile *.html set filetype=php
au BufRead,BufNewFile *.thtml set filetype=htmldjango
au BufRead,BufNewFile *.lhtml set filetype=htmldjango
au BufRead,BufNewFile *.module set filetype=php
au BufRead,BufNewFile *.install set filetype=php
au BufRead,BufNewFile *.profile set filetype=php
au BufRead,BufNewFile *.md set filetype=markdown

" HTML has long lines and short indents
autocmd FileType kid setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType html setlocal textwidth=0 tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType thtml setlocal textwidth=0 tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType lhtml setlocal textwidth=0 tabstop=2 shiftwidth=2 softtabstop=2

autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4

autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python setlocal foldmethod=indent foldminlines=15 foldnestmax=2 foldcolumn=2

" fail
autocmd FileType virata set filetype=php
