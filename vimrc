" normal color
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

set nowrap 
set number

set lazyredraw
set ruler
set autoread " auto read updates to file from outside vim

" highlight the current line
set cursorline

" make backspace act normal (can be issue in some versions)
set backspace=2

syntax on
filetype on
filetype indent on
filetype plugin on

" run all tests in file
map <silent> <C-S-F10> :!rake %:r".t"<CR>
map <silent> <S-C-F10> :!rake %:r".t"<CR>

" choose test to run in file
map <silent> <C-S-F11> :!rake %:r".it"<CR>
map <silent> <S-C-F11> :!rake %:r".it"<CR>

" USURE IF I WANT THESE
set showmatch
set matchtime=1

" tab settings
nnoremap <silent> <C-n> :tabnext<CR>
nnoremap <silent> <C-p> :tabprevious<CR>

" Remap alt-j alt-k to insert blank lines without going to insert mode
nnoremap <silent><D-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><D-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" split editing settings
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_ 
set wmh=0

" easy to source / edit this file
map ,s :source ~/.vimrc<CR>
map ,v :tabedit ~/.vimrc<CR>

" NERDCommenter
" map comments to apple/
nmap <D-/> ,c<Space>
vmap <D-/> ,c<Space>
imap <D-/> <C-O>,c<Space>

" Fuzzy Finder

" fuzzy finder mapping
" file
map <leader>n :FufFile **/<CR>
"map <C-n> :FufFile **/<CR>

" tag
map <leader>t :FufTag<CR>
map <C-S-F12> :FufTag<CR>
map <S-C-F12> :FufTag<CR>

" buffer
map <leader>e :FufBuffer<CR>

" renew finder cache shortcut
map <leader>r :FufRenewCache<CR>

" NERDTree

" Make F2 open NERDTree
nmap <silent> <F2> :NERDTreeToggle<CR>

" TAGS

" Remap autocomplete to CTRL+SPACE
inoremap <C-space> <C-n>

" rebuild ctags
map <silent> <LocalLeader>rt :!ctags -R --exclude=".git\|.svn\|log\|tmp\|db\|pkg" --extra=+f<CR>

"yay for vim vlojure
let clj_highlight_builtins = 1
let clj_highlight_contrib = 1
let clj_paren_rainbow = 1
let vimclojure#NailgunClient = "/opt/local/vimclojure/ng"
let clj_want_gorilla = 1

" pastetoggle
set pastetoggle=<F5>

" pathogen
call pathogen#runtime_append_all_bundles()
