" leader
let mapleader = ","

colorscheme desert

" solarized color
"syntax enable
"set background=dark
"colorscheme solarized

" vim setting
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2

" set default font
set gfn=Inconsolata:h16

set incsearch
set hlsearch
set ignorecase

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
nnoremap <silent> <C-S-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent> <C-S-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" split editing settings
set wmh=0

" easy to source / edit this file
map ,s :source ~/.vimrc<CR>
map ,v :tabedit ~/.vimrc<CR>

" Fuzzy Finder

let mapleader="\\"

" fuzzy finder mapping
" file
map <leader>n :FufFile **/<CR>

" tag
map <leader>t :FufTag<CR>

" buffer
map <leader>e :FufBuffer<CR>

" renew finder cache shortcut
map <leader>r :FufRenewCache<CR>

let mapleader=","

" NERDTree

" Make F2 open NERDTree
nmap <silent> <F2> :NERDTreeToggle<CR>

" TAGS
" rebuild ctags
map <silent> <LocalLeader>rt :!ctags -R --exclude=".git\|.svn\|log\|tmp\|db\|pkg" --extra=+f<CR>

"yay for vim vlojure
let clj_highlight_builtins = 1
let clj_highlight_contrib = 1
let clj_paren_rainbow = 1
let vimclojure#NailgunClient = "/opt/local/vimclojure/ng"
let clj_want_gorilla = 1

" Tabularize
if exists(":Tabularize")
  nmap <LocalLeader>a= :Tabularize /=<CR>
  vmap <LocalLeader>a= :Tabularize /=<CR>
  nmap <LocalLeader>a. :Tabularize /=><CR>
  vmap <LocalLeader>a. :Tabularize /=><CR>
  nmap <LocalLeader>a: :Tabularize /:\zs<CR>
  vmap <LocalLeader>a: :Tabularize /:\zs<CR>
endif

let mapleader = ","

" map capital W and Q to lowecase
nmap :W :w
nmap :Q :q

" pathogen
"call pathogen#runtime_append_all_bundles()

filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on
