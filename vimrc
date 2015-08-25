" bundles
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" syntax files
Bundle 'sheerun/vim-polyglot'

" completion
" Bundle "szw/vim-kompleter"
" Bundle 'Valloric/YouCompleteMe'

" Other
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'rizzatti/greper.vim'
Bundle 'ihacklog/tabular'
Bundle 'kchmck/vim-coffee-script'
Bundle 'scrooloose/nerdtree'
"Bundle 'scrooloose/nerdcommenter'
Bundle 'tomtom/tcomment_vim'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'muz/vim-gemfile'
Bundle 'tmhedberg/matchit'

Bundle 'bling/vim-airline'

Bundle 'tpope/vim-fugitive'
Bundle 'sjl/gundo.vim'

Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'

" ReactJs & JSX
Bundle 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsx'
Bundle 'mtscout6/vim-cjsx'

" Angular
Bundle 'burnettk/vim-angular'

" Themes
Bundle 'chriskempson/base16-vim'

" Tmux Nav
Bundle 'christoomey/vim-tmux-navigator'

" Clojure in Vim
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-fireplace'
"Bundle 'manicolosi/vim-fireplace'
"Bundle 'vim-scripts/paredit.vim'
Bundle 'guns/vim-sexp'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-sexp-mappings-for-regular-people'
Bundle 'amdt/vim-niji'
Bundle 'guns/vim-clojure-highlight'

" vim syntax checker
Bundle 'scrooloose/syntastic'
" clojure formatting plugin
Bundle 'venantius/vim-cljfmt'
"clojure lint
"Bundle 'venantius/vim-eastwood'

" Show colors
Bundle "gorodinskiy/vim-coloresque"

filetype plugin indent on

let mapleader = ","                                  " leader

set background=dark
let base16colorspace=256
" colorscheme base16-default
colorscheme base16-chalk
let g:airline_theme='base16'

let g:airline_left_sep=''
let g:airline_right_sep=''

" vim setting
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set gfn=Inconsolata                                 " set default font
set incsearch                                       " show search as typing
set hlsearch                                        " highlight search results
set ignorecase                                      " case insensitive search
set smartcase                                       " ...unless there is a capital letter

set hidden                                          " allow changing buffers without saving
set wrap                                            " do not wrap a long line onto line below
set number                                          " show line numbers
set ruler                                           " show cursor position in status bar
set autoread                                        " auto read updates to file from outside vim
set pastetoggle=<F3>                                " pastetoggle
set cursorline                                      " highlight the current line
set backspace=2                                     " make backspace act normal (can be issue in some versions)
set showmatch                                       " show matching {} {} etc
set matchtime=1

set wildmenu                                        " better command completion
set wildmode=longest,full                           " list completions, complete longest common
set wildignore+=*/tmp/*,*.so,*.swp,*.zip            " MacOSX/Linux wildignore for vim
set wildignore+=*/target/*,*/out/*,.DS_Store

set showcmd                                         " show commands as they are types
set visualbell                                      " turn off auditory bell
set autowrite                                       " auto-save current buffer when switching
set nosplitright                                    " split to the left, not right
set nosplitbelow                                    " split to top, not bottom

set smartindent   " try to be smart about indentation
set autoindent    " ditto
set smarttab      " smarter tabbing

set grepprg=git\ grep\ -n\ $*

autocmd BufWritePre * :%s/\s\+$//e " Auto-strip trailing whitespace on write

syntax on
filetype on
filetype indent on
filetype plugin on

" *** MAPPINGS ***
nnoremap j gj
nnoremap k gk

nnoremap <CR> :nohlsearch<CR>
nnoremap <Leader><Leader> <C-^>

" Remap ctrl+j ctrl+k to insert blank lines without going to insert mode
"nnoremap <silent> <C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
"nnoremap <silent> <C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" move lines
"nnoremap <silent> <S-Down> :set paste<CR>dd]p :set nopaste<CR>
"nnoremap <silent> <S-Up> :set paste<CR>ddk]P :set nopaste<CR>

" split line at cursor without moving cursor
nnoremap <silent> <LocalLeader>s :set paste<CR>m`i<CR><Esc>``:set nopaste<CR>

" magic from @manicolosi
nnoremap <leader>p ya(%a<CR><esc>p

" easy to source / edit this file
map ,s :source ~/.vimrc<CR>
map ,v :tabedit ~/.vimrc<CR>

" NERDTree
nmap <silent> <F2> :NERDTreeToggle<CR>                 " Make F2 open NERDTree
nmap <silent> <LocalLeader>l :NERDTreeFind<CR>         " Locate current file in NERDTree

" TAGS
map <silent> <LocalLeader>rt :!/usr/local/bin/ctags -R --exclude=".git\|.svn\|log\|tmp\|db\|pkg" --extra=+f --fields=+l<CR>  " rebuild ctags

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

" Clojure Commands
let g:clojure_fuzzy_indent_patterns = ['describe', 'it', '^doto', '^with', '^def', '^let', 'go-loop', '^at-media', 'GET', 'POST', 'PUT', 'ANY', 'DELETE', 'context', 'match']
let g:ycm_collect_identifiers_from_tags_files = 1
nnoremap <silent> cq; :Eval<CR>
nnoremap <silent> cq: cpp<CR>
nnoremap <silent> cqa :%Eval<CR>
nnoremap <silent> <leader>E :%Eval<CR>
nnoremap <silent> <leader>R :%Eval<CR>:Eval (refresh)<CR>

" Slurp right and left
nmap <silent> <Plug>SlurpRight ml>)%==`l:call repeat#set("\<Plug>SlurpRight", v:count)<CR>
nmap <Leader>) <Plug>SlurpRight

nmap <silent> <Plug>SlurpLeft ml<(%==`l:call repeat#set("\<Plug>SlurpLeft", v:count)<CR>
nmap <Leader>( <Plug>SlurpLeft

" Barf right and left
nmap <silent> <Plug>BarfRight ml)ma<)`a==`l:call repeat#set("\<Plug>BarfRight", v:count)<CR>
nmap <Leader>< <Plug>BarfRight

nmap <silent> <Plug>BarfLeft ml>(`l:call repeat#set("\<Plug>BarfLeft", v:count)<CR>
nmap <Leader>> <Plug>BarfLeft

" Clojure Android Commands
command! DroidConnect Connect nrepl://localhost:9999
nnoremap <leader>dc :DroidConnect<CR><CR>

command! FrodoConnect Connect nrepl://localhost:9002
command! SimpleBrepl Piggieback (weasel.repl.websocket/repl-env :ip "0.0.0.0" :port 9001)

" Gundo
nnoremap <F5> :GundoToggle<CR>

" statusline stuffs
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

" solarized color
syntax enable
"set background=dark
"colorscheme solarized

" change localleader
let maplocalleader = ","

" ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
"let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_working_path_mode=0
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|node_modules|\.bundle)$'
let g:ctrlp_show_hidden = 1                                                       " show hidden files
let g:ctrlp_extensions = ['tag', 'dir', 'undo', 'line', 'changes']
"let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                        "\ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
nmap <silent> <Leader><space> :CtrlP<CR>
"nmap <silent> <c-n> :CtrlP<CR>

" Clojure fmt autosave off
let g:clj_fmt_autosave = 0

" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
nmap <silent> <Leader>y :SyntasticToggleMode<CR>


" quicklist navigation
"nnoremap [q :cp<CR>
"nnoremap ]q :cn<CR>

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

" close all the hings
nmap <silent> <C-w>a :ccl<CR>:lcl<CR>:pc<CR>

" search Dash for word under cursor
nmap <silent> <leader>d <Plug>DashSearch

nmap <silent><Leader>A :grep <cword><CR>:botright copen<CR>

function! NReplConnectFn(port)
  exec "Connect nrepl://localhost:".a:port
endfunction

command! -nargs=1 NReplConnect call NReplConnectFn(<q-args>)
command! -nargs=1 ConnectRepl call NReplConnectFn(<q-args>)

"command! -nargs=+ Grep :silent grep! <args> | botright copen
command! Ctw %s/\s\+$//g
command! Ftabs %s/<C-I>/  /g
command! Tig !tig -- %
command! Ann !git annotate %
command! Diff !git dt -- %
