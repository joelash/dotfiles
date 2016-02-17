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

"nvim node-host
"Bundle 'neovim/node-host'

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

" Ctrlp extensions
Bundle 'naquad/ctrlp-digraphs.vim'

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
"Bundle 'tpope/vim-fireplace'
Bundle 'christoph-frick/vim-fireplace'
Bundle 'guns/vim-sexp'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-sexp-mappings-for-regular-people'
Bundle 'amdt/vim-niji'
Bundle 'guns/vim-clojure-highlight'

" color the vimline same as vimairline
Bundle 'manicolosi/vim-airline-colornum'

" vim syntax checker
Bundle 'scrooloose/syntastic'

let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_always_populate_loc_list = 1

" tab names
Plugin 'manicolosi/taboo.vim'

let g:taboo_modified_tab_flag = "‡"
let g:taboo_tab_format = "[%N. %P%m] "

" taboo reset-tab-names
nmap <silent> <C-J>f :let g:taboo_tab_format="[%N. %f%m] "<CR>:TabooReset<CR>
nmap <silent> <C-J>d :let g:taboo_tab_format="[%N. %P%m] "<CR>:TabooReset<CR>

" clojure formatting plugin
Bundle 'venantius/vim-cljfmt'
"clojure lint
"Bundle 'venantius/vim-eastwood'

" Show colors
Bundle "gorodinskiy/vim-coloresque"

filetype plugin indent on

let mapleader = ","                                  " leader

" move the swp files
set backup
set swapfile
set backupdir=~/.vim/swp
set directory=~/.vim/swp

" undo directory
set undofile
set undodir=~/.vim/undo

set background=dark
let base16colorspace=256
" colorscheme base16-default
" colorscheme base16-chalk
colorscheme base16-monokai
let g:airline_theme='base16'

let g:airline_left_sep=''
let g:airline_right_sep=''

"let g:airline_section_b = '[%{fnamemodify(getcwd(),":t")}]'

" current direction on statusline

" vim setting
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

"set gfn=Inconsolata                                 " set default font
set gfn=Hack                                        " set default font
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
nnoremap <silent> <leader>J :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent> <leader>K :set paste<CR>m`O<Esc>``:set nopaste<CR>

" move lines
"nnoremap <silent> <S-Down> :set paste<CR>dd]p :set nopaste<CR>
"nnoremap <silent> <S-Up> :set paste<CR>ddk]P :set nopaste<CR>

" split line at cursor without moving cursor
nnoremap <silent> <LocalLeader>s :set paste<CR>m`i<CR><Esc>``:set nopaste<CR>

" magic from @manicolosi
nnoremap <leader>p ya(%a<CR><esc>p

" easy to source / edit this file
map ,S :source ~/.vimrc<CR>
map <silent> ,v :tabedit ~/.vimrc<CR>:lcd ~/src/github/dotfiles/mine<CR>

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

" filetype on boot and cljx
autocmd BufRead,BufNewFile *.cljx setfiletype clojure
autocmd BufRead,BufNewFile build.boot setfiletype clojure

" Clojure Commands
let g:clojure_fuzzy_indent_patterns = ['^doto', '^with', '^def', '^let', 'go-loop', 'GET', 'POST', 'PUT', 'ANY', 'DELETE', 'PATCH', '^context', 'match']
let g:ycm_collect_identifiers_from_tags_files = 1
nnoremap <silent> cq; :Eval<CR>
nnoremap <silent> cq: cpp<CR>
nnoremap <silent> cqa :%Eval<CR>
nnoremap <silent> crr :Require!<CR>:RunTests<CR>:copen<CR>
nnoremap <silent> <leader>E :%Eval<CR>
nnoremap <silent> <leader>R :%Eval<CR>:Eval (refresh)<CR>

" Sort namespaces in (:require)
nmap <leader>s mzgg/:require$<CR>)i<CR><ESC>(jV)b:sort<CR>))bJ:nohl<CR>`z

nmap <Leader>F <Plug>FireplacePrint<Plug>(sexp_outer_top_list)``
nmap <Leader>f <Plug>FireplacePrint<Plug>(sexp_outer_list)``
nmap <Leader>e <Plug>FireplacePrint<Plug>(sexp_inner_element)``
nmap <Leader>E :%Eval<CR>

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

" Breaks color theme for CtrlP in airline...?
hi normal ctermbg=none

" change localleader
let maplocalleader = ","

" ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
"let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_working_path_mode=0
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|node_modules|\.bundle)$'
let g:ctrlp_show_hidden = 1                                                       " show hidden files
let g:ctrlp_extensions = ['tag', 'dir', 'undo', 'line', 'changes', 'digraphs']
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
let g:syntastic_auto_loc_list = 0
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

" close all the things
nmap <silent> <C-w>a :ccl<CR>:lcl<CR>:pc<CR>

" search Dash for word under cursor
nmap <silent> <leader>d <Plug>DashSearch

nmap <silent><Leader>A :grep <cword><CR>:botright copen<CR>

" uuidgen
imap <C-J>u <C-r>=substitute(system("uuidgen"), '.$', '', 'g')<CR>

function! NReplConnectFn(port)
  exec "Connect nrepl://localhost:".a:port
endfunction

function! DockerReplConnectFn(port)
  exec "Connect nrepl://docker.dev:".a:port
endfunction

function! AclReplConnectFn(port)
  exec "Connect nrepl://local.aclaimant.com:".a:port
endfunction

command! -nargs=1 NReplConnect call NReplConnectFn(<q-args>)
command! -nargs=1 ConnectRepl call NReplConnectFn(<q-args>)
command! -nargs=1 DConnect call DockerReplConnectFn(<q-args>)
command! -nargs=1 AConnect call AclReplConnectFn(<q-args>)
command! Figwheel :Piggieback! (do (require 'figwheel-sidecar.repl-api) (figwheel-sidecar.repl-api/cljs-repl))

" connect to boot cljs-repl
nmap <leader>bb :Piggieback (adzerk.boot-cljs-repl/repl-env)<CR><CR>

"command! -nargs=+ Grep :silent grep! <args> | botright copen
command! Ctw %s/\s\+$//g
command! Ftabs %s/<C-I>/  /g
command! Tig !tig -- %
command! Ann !git annotate %
command! Diff !git dt -- %
command! Pbcopy !cat % | pbcopy

" go to paste mode automatically on paste
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" Tab swtiching
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<CR>

au TabLeave * let g:lasttab = tabpagenr()
" Go to last active tab
nnoremap <silent> <leader>` :exe "tabn ".g:lasttab<CR>
vnoremap <silent> <leader>` :exe "tabn ".g:lasttab<CR>

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" end go to auto paste mode
