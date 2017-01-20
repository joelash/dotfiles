" ----------------------------------------------------
"                       Plug
" ----------------------------------------------------
" Install vim-plug if we don't already have it
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    execute 'mkdir -p ~/.vim/plugged'
    execute 'mkdir -p ~/.vim/autoload'
    " Download the actual plugin manager
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

" syntax files
Plug 'sheerun/vim-polyglot'

" Other
Plug 'rizzatti/funcoo.vim'
Plug 'rizzatti/dash.vim'
Plug 'mhinz/vim-grepper'
Plug 'kchmck/vim-coffee-script'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'muz/vim-gemfile', {'for': 'ruby'}
Plug 'tmhedberg/matchit', { 'for': ['html', 'xml'] }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" Easy Alignment
Plug 'junegunn/vim-easy-align'

" Only show cursorline in the current window
Plug 'vim-scripts/CursorLineCurrentWindow'

" Completion
Plug 'mattn/emmet-vim', { 'for': 'html' }

" Ctrlp extensions
Plug 'naquad/ctrlp-digraphs.vim'

" Angular
Plug 'burnettk/vim-angular'

" ReactJs & JSX
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0 " enabled JSX highlighting for .js files too

" Themes
Plug 'chriskempson/base16-vim'

" Tmux Nav
Plug 'christoomey/vim-tmux-navigator'

" Clojure in Vim
Plug 'guns/vim-clojure-static'
Plug 'christoph-frick/vim-fireplace', { 'for': 'clojure' }
Plug 'guns/vim-sexp'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'losingkeys/vim-niji'
Plug 'guns/vim-clojure-highlight'
Plug 'venantius/vim-cljfmt'

" vim syntax checker
Plug 'scrooloose/syntastic'

let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_always_populate_loc_list = 1

" tab names
Plug 'manicolosi/taboo.vim'

let g:taboo_modified_tab_flag = "‡"
let g:taboo_tab_format = "[%N. %P%m] "

" taboo reset-tab-names
nmap <silent> <C-G>f :let g:taboo_tab_format="[%N. %f%m] "<CR>:TabooReset<CR>
nmap <silent> <C-G>d :let g:taboo_tab_format="[%N. %P%m] "<CR>:TabooReset<CR>

filetype plugin indent on                   " required!
call plug#end()

" ---------------------------------------------------------
"                       End Plug
" ---------------------------------------------------------


let mapleader = ","                                  " leader

" move the swp files
set backup
set swapfile
set backupdir=~/.vim/swp
set directory=~/.vim/swp

" undo directory
set undofile
set undodir=~/.vim/undo

set background=light
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

let g:airline_theme='base16'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#taboo#enabled = 1

function! BranchWithPairs(branch_name)
  let initials_raw=system("git config --get user.initials")
  let initials= substitute(initials_raw, '\%x00', '', '')
  let initials_str = ' [' . initials . ']'
  if empty(initials)
    let initials_str = ''
  end
  return a:branch_name . initials_str
endfunction
let g:airline#extensions#branch#format = 'BranchWithPairs'

function! WindowNumber()
  let str=tabpagewinnr(tabpagenr())
  return str
endfunction

let g:airline_section_z = airline#section#create(['%3p%%'.airline_symbols.space, 'linenr',  ':%3v', ':'.airline_symbols.space.'#%{WindowNumber()}'])

" Define Ctrl-w + num to go to vim window
let i = 1
while i <= 9
   execute 'nnoremap <C-w>' . i . ' :' . i . 'wincmd w<CR>'
   let i = i + 1
endwhile


" current direction on statusline

" statusline stuffs
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

" vim setting
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set list
set listchars=tab:→\ ,trail:␣,extends:↩,nbsp:.

" shiftwidth and tabstop for files
au FileType java setl sw=4 ts=4
au FileType groovy setl sw=4 ts=4
au FileType coffee setl sw=2 ts=2

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
set splitright                                      " split to the right, not left
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

" Spelling
set spelllang=en_us
set spellfile=$HOME/Dropbox/Apps/vim/spell/en-utf-8.add
set spell

" *** MAPPINGS ***
nnoremap j gj
nnoremap k gk

nnoremap <CR> :nohlsearch<CR>
nnoremap <Leader><Leader> <C-^>

" Remap ctrl+j ctrl+k to insert blank lines without going to insert mode
nnoremap <silent> <leader>J :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent> <leader>K :set paste<CR>m`O<Esc>``:set nopaste<CR>

" split line at cursor without moving cursor
nnoremap <silent> <LocalLeader>s :set paste<CR>m`i<CR><Esc>``:set nopaste<CR>

" magic from @manicolosi
nmap <leader>p (y%%a<CR><esc>p==

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
nnoremap <silent> cq; :Eval<CR>
nnoremap <silent> cq: cpp<CR>
nnoremap <silent> cqa :%Eval<CR>
nnoremap <silent> crr :Require!<CR>:RunTests<CR>:copen<CR>
nnoremap <silent> <leader>E :%Eval<CR>
nnoremap <silent> <leader>R :%Eval<CR>:Eval (refresh)<CR>

" Sort namespaces in (:require)
function! CljSortRequireFn(find)
  let l:initialLine = line(".")
  let l:initialCol = col(".")
  exec "keepjumps normal gg"
  exe "keepjumps /". a:find ."$"
  let l:startLine = line(".") + 1
  if l:startLine != 2
    exe "keepjumps normal ^%"
    keepjumps let l:endLine = line(".")
    exe "keepjumps normal i\<CR>\<ESC>"
    let l:closingLine = l:endLine + 1
    exe l:startLine.",".l:endLine."sort"
    exe "keepjumps normal ".l:closingLine."gg"
    exe "keepjumps normal kJ"
  endif
  call cursor(l:initialLine, l:initialCol)
endfunction

command! -nargs=1 CljSortRequire call CljSortRequireFn(<q-args>)
nmap <silent> <leader>s :CljSortRequire :require<CR>
nmap <silent> <leader>m :CljSortRequire :require-macros<CR>

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

" Gundo
nnoremap <F5> :GundoToggle<CR>

" Breaks color theme for CtrlP in airline...?
hi normal ctermbg=none

" change localleader
let maplocalleader = ","

" ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode=0
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|node_modules|\.bundle|\.cljs_rhino_repl)$'
let g:ctrlp_show_hidden = 1                                                       " show hidden files
let g:ctrlp_extensions = ['tag', 'dir', 'undo', 'line', 'changes', 'digraphs']
nmap <silent> <Leader><space> :CtrlP<CR>

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

" Easy alignment
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" close all the things
nmap <silent> <C-w>a :ccl<CR>:lcl<CR>:pc<CR>

" search Dash for word under cursor
nmap <silent> <leader>d <Plug>DashSearch

nmap <silent><Leader>A :grep <cword><CR>:botright copen<CR>

" tab editing in a new dir
function! TabLcdFn(dir)
  tabnew
  exec "lcd " . a:dir
endfunction

command! -nargs=1 -complete=dir TabLcd call TabLcdFn(<q-args>)
cabbrev tablcd TabLcd
cabbrev td TabLcd

" ag
cabbrev Agq GrepperAg
" Let's  enter open from quicklist
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

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
