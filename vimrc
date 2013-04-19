" bundles
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'Valloric/YouCompleteMe'

" leader
let mapleader = ","

"colorscheme desert

" vim setting
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" set default font
set gfn=Inconsolata-dz\ for\ Powerline

set incsearch
set hlsearch
set ignorecase

" allow changing buffers without saving
set hidden

set nowrap
set number

set lazyredraw
set ruler
set autoread " auto read updates to file from outside vim

" pastetoggle
set pastetoggle=<F5>

" highlight the current line
set cursorline

" make backspace act normal (can be issue in some versions)
set backspace=2

syntax on
filetype on
filetype indent on
filetype plugin on

" USURE IF I WANT THESE
set showmatch
set matchtime=1

" Remap ctrl+j ctrl+k to insert blank lines without going to insert mode
nnoremap <silent> <C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent> <C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" move lines
nnoremap <silent> <S-Down> :set paste<CR>dd]p :set nopaste<CR>
nnoremap <silent> <S-Up> :set paste<CR>ddk]P :set nopaste<CR>

" split editing settings
set wmh=0

" easy to source / edit this file
map ,s :source ~/.vimrc<CR>
map ,v :tabedit ~/.vimrc<CR>

" Fuzzy Finder

" fuzzy finder mapping
" file
map <LocalLeader>n :FufFile **/<CR>


" tag
map <LocalLeader>t :FufTag<CR>

" buffer
map <LocalLeader>e :FufBuffer<CR>

" renew finder cache shortcut
map <LocalLeader>r :FufRenewCache<CR>

" NERDTree

" Make F2 open NERDTree
nmap <silent> <F2> :NERDTreeToggle<CR>

" Locate current file in NERDTree
nmap <silent> <LocalLeader>l :NERDTreeFind<CR>

" TAGS
" rebuild ctags
map <silent> <LocalLeader>rt :!/usr/local/bin/ctags -R --exclude=".git\|.svn\|log\|tmp\|db\|pkg" --extra=+f<CR>

" map capital W and Q to lowecase
nmap :W :w
nmap :Q :q

" ruby stuff
augroup myfiletypes
    " Clear old autocmds in group
    autocmd!
    " autoindent with two spaces, always expand tabs
    autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

filetype off
call pathogen#incubate()
call pathogen#helptags()
filetype plugin indent on

" vim-powerline
let g:Powerline_symbols = 'fancy'
" call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

" statusline stuffs
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

" solarized color
syntax enable
set background=dark
colorscheme solarized

" ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
nmap <silent> <Leader><space> :CtrlP<CR>

" Tabularize
nmap <silent> <Leader>a= :Tabularize /=\(>\)\@!<CR>
vmap <silent> <Leader>a= :Tabularize /=\(>\)\@!<CR>
nmap <silent> <Leader>a. :Tabularize /=><CR>
vmap <silent> <Leader>a. :Tabularize /=><CR>
nmap <silent> <Leader>a: :Tabularize /:<CR>
vmap <silent> <Leader>a: :Tabularize /:<CR>
nmap <silent> <Leader>a{ :Tabularize /{<CR>
vmap <silent> <Leader>a{ :Tabularize /{<CR>
nmap <silent> <Leader>a} :Tabularize /}<CR>
vmap <silent> <Leader>a} :Tabularize /}<CR>

nmap <Leader>a; :Tabularize /:\zs<CR>
vmap <Leader>a; :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

command! Ctw %s/\s\+$//g
command! Ftabs %s/<C-I>/  /g
