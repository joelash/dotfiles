" bundles
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'Valloric/YouCompleteMe'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'

call pathogen#incubate()
call pathogen#helptags()
filetype plugin indent on

let mapleader = ","                                  " leader

"colorscheme desert

" vim setting
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set gfn=Inconsolata-dz\ for\ Powerline              " set default font
set incsearch                                       " show search as typing
set hlsearch                                        " highlight search results
set ignorecase                                      " case insensitive search
set smartcase                                       " ...unless there is a capital letter

set hidden                                          " allow changing buffers without saving
set nowrap                                          " do not wrap a long line onto line below
set number                                          " show line numbers
"set lazyredraw
set ruler                                           " show cursor position in status bar
set autoread                                        " auto read updates to file from outside vim
set pastetoggle=<F3>                                " pastetoggle
set cursorline                                      " highlight the current line
set backspace=2                                     " make backspace act normal (can be issue in some versions)
set showmatch                                       " show matching {} {} etc
set matchtime=1

set wildmode=list:longest                           " list completions, complete longest common
set wildmenu                                        " better command completion
set showcmd                                         " show commands as they are types
set visualbell                                      " turn off auditory bell
set autowrite                                       " auto-save current buffer when switching
set nosplitright                                    " split to the left, not right
set nosplitbelow                                    " split to top, not bottom

set smartindent   " try to be smart about indentation
set autoindent    " ditto
set smarttab      " smarter tabbing

set grepprg=git\ grep\ -n\ $*

"set winwidth=200
set winheight=5
set winminheight=5
set winheight=999
"set wmh=0 " split editing settings

autocmd BufWritePre * :%s/\s\+$//e " Auto-strip trailing whitespace on write

" *** MAPPINGS ***

nnoremap <CR> :nohlsearch<CR>
nnoremap <Leader><Leader> <C-^>

" Remap ctrl+j ctrl+k to insert blank lines without going to insert mode
nnoremap <silent> <C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent> <C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" move lines
nnoremap <silent> <S-Down> :set paste<CR>dd]p :set nopaste<CR>
nnoremap <silent> <S-Up> :set paste<CR>ddk]P :set nopaste<CR>

" easy to source / edit this file
map ,s :source ~/.vimrc<CR>
map ,v :tabedit ~/.vimrc<CR>

" Fuzzy Finder
map <LocalLeader>n :FufFile **/<CR>                    " file
map <LocalLeader>t :FufTag<CR>                         " tag
map <LocalLeader>e :FufBuffer<CR>                      " buffer
map <LocalLeader>r :FufRenewCache<CR>                  " renew finder cache shortcut

" NERDTree
nmap <silent> <F2> :NERDTreeToggle<CR>                 " Make F2 open NERDTree
nmap <silent> <LocalLeader>l :NERDTreeFind<CR>         " Locate current file in NERDTree

" TAGS
map <silent> <LocalLeader>rt :!/usr/local/bin/ctags -R --exclude=".git\|.svn\|log\|tmp\|db\|pkg" --extra=+f<CR>  " rebuild ctags

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

" vim-powerline
"let g:Powerline_symbols = 'fancy'
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
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|node_modules|\.bundle)$'
let g:ctrlp_show_hidden = 1                                                       " show hidden files
let g:ctrlp_extensions = ['tag', 'dir', 'undo', 'line', 'changes']
nmap <silent> <Leader><space> :CtrlP<CR>
nmap <silent> <c-n> :CtrlP<CR>

" quicklist navigation
nnoremap [q :cp<CR>
nnoremap ]q :cn<CR>

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
nmap <Leader>a, :Tabularize /,\zs<CR>
vmap <Leader>a, :Tabularize /,\zs<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

" search Dash for word under cursor
nmap <silent> <leader>d <Plug>DashSearch

nmap <silent><Leader>A :grep <cword><CR>:botright copen<CR>

command! -nargs=+ Grep execute 'silent grep! <args>' | botright copen
command! Ctw %s/\s\+$//g
command! Ftabs %s/<C-I>/  /g
command! Tig !tig -- %
