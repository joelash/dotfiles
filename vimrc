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

" NERDTree

" Make F2 open NERDTree
nmap <silent> <F2> :NERDTreeToggle<CR>

" Locate current file in NERDTree
nmap <silent> <leader>l :NERDTreeFind<CR>

" TAGS
" rebuild ctags
map <silent> <LocalLeader>rt :!ctags -R --exclude=".git\|.svn\|log\|tmp\|db\|pkg" --extra=+f<CR>

"yay for vim vlojure
let clj_highlight_builtins = 1
let clj_highlight_contrib = 1
let clj_paren_rainbow = 1
let vimclojure#NailgunClient = "/opt/local/vimclojure/ng"
let clj_want_gorilla = 1


" map capital W and Q to lowecase
nmap :W :w
nmap :Q :q

" pathogen
"call pathogen#runtime_append_all_bundles()

" ruby stuff
augroup myfiletypes
    " Clear old autocmds in group
    autocmd!
    " autoindent with two spaces, always expand tabs
    autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

let mapleader=','

" Tabularize
nmap <silent> <Leader>a= :Tabularize /=\(>\)\@!<CR>
vmap <silent> <Leader>a= :Tabularize /=\(>\)\@!<CR>
nmap <silent> <Leader>a. :Tabularize /=><CR>
vmap <silent> <Leader>a. :Tabularize /=><CR>
nmap <silent> <Leader>a: :Tabularize /:\zs<CR>
vmap <silent> <Leader>a: :Tabularize /:\zs<CR>
nmap <silent> <Leader>a{ :Tabularize /{<CR>
vmap <silent> <Leader>a{ :Tabularize /{<CR>
nmap <silent> <Leader>a} :Tabularize /}<CR>
vmap <silent> <Leader>a} :Tabularize /}<CR>

nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

"nmap <Leader>a= :Tabularize /=<CR>
"vmap <Leader>a= :Tabularize /=<CR>
"nmap <Leader>a: :Tabularize /:<CR>
"vmap <Leader>a: :Tabularize /:<CR>
