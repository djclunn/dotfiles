""""""""""""""""""""""""""""""""""
" =>
" =>> Vundle
" =>
""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
if has("win16") || has("win32")
    set rtp+=$HOME/.vim/bundle/Vundle.vim/
    call vundle#begin('$HOME/.vim/bundle/')
else
    set rtp+=~/.vim/bundle/Vundle.vim/
    call vundle#begin('~/.vim/bundle/')
endif
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" => PLUGINS START
" =>

" More sensible code folding
Plugin 'tmhedberg/SimpylFold'
" Function spanning autoindent
Plugin 'vim-scripts/indentpython.vim'
" Colors
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
" Proper file tree
Plugin 'scrooloose/nerdtree'
" Find files or tags
Plugin 'kien/ctrlp.vim'
" Status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'jpalardy/vim-slime'
Plugin 'simnalamburt/vim-mundo'


"Show buffers in command line
"Plugin 'bling/vim-bufferline'

" =>
" => PLUGINS END
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
""""""""""""""""""""""""""""""""""
" =>
" =>> Plugin Settings
" =>
""""""""""""""""""""""""""""""""""
"
" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
" Settings for vim-slime
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}

""""""""""""""""""""""""""""""""""
" =>
" =>> Prebuilt
" =>
""""""""""""""""""""""""""""""""""
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd matchit
endif

""""""""""""""""""""""""""""""""""
" =>
" =>> Devin Vim Settings
" =>
""""""""""""""""""""""""""""""""""

" Make .vim directory for backup, swap, undo files
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
" Make home folder for undo files
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "", 0700)
endif
set undodir^=$HOME/.vim/undo//
set undofile
" same for swap files
if !isdirectory($HOME."/.vim/swap")
    call mkdir($HOME."/.vim/swap", "", 0700)
endif
set directory^=$HOME/.vim/swap//
set swapfile
" same for backup files
if !isdirectory($HOME."/.vim/backup")
    call mkdir($HOME."/.vim/backup", "", 0700)
endif
set backupdir^=$HOME/.vim/backup//
set backup
" TODO set cron job to clean up swap and backups
" https://vi.stackexchange.com/questions/6/how-can-i-use-the-undofile

" j/k moves keep these number of lines on screen
set so=7

" Revert Q map to format and make it Ex mode
unmap Q

set nu

" all about dem tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround		" always indent outdent to nearest tabstop
set expandtab
set smarttab		" use tabs at the start of a line, spaces elsewhere
"set nowrap

set ignorecase
set smartcase
set nohlsearch
set incsearch
set showmatch

set mouse=a
"set vb t_vb=[?5h$<100>[?5l
" Visual flash instead of bell
set vb

set splitbelow
set splitright

""""""""""""""""""""""""""""""""""
" =>
" =>> Code
" =>
""""""""""""""""""""""""""""""""""
set foldcolumn=1

syntax enable

" Enable folding
set foldmethod=indent
set foldlevel=99

" Python files that conform to git standard
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Full stack development
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

set encoding=utf-8

let python_highlight_all=1
syntax on

"ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

""""""""""""""""""""""""""""""""""
" =>
" =>> Colors
" =>
""""""""""""""""""""""""""""""""""
colorscheme desert 
" if has('gui_running')
" 	"set background=dark
" 	"colorscheme solarized
" 	colorscheme desert
"     set lines=99
" else
"     "colorscheme wombat
"     "colorscheme zenburn
" endif
" 
" colorscheme wombat
" set background=light
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>> MAPs
" :map =	 recursive
" :noremap = no recursive
" :nmap =	 normal mode map
" :vmap =	 visual mode map
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Mundo plugin map
map <F3> :MundoToggle<CR>

" Escape maps
nnoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
" cnoremap <Tab> <C-C><Esc>
inoremap <Tab> <Esc>`^
inoremap <Leader><Tab> <Tab>

" imap ii <Esc>`^
imap jj <Esc>`^

let mapleader=","

if has("gui_running")
    map <Leader>h :vert help<CR>:let &columns=&columns*2<CR><C-W>=
    map <Leader>ch <C-W>b:clo<CR>:let &columns=&columns/2<CR>
else
    map <Leader>h :vert help<CR>
endif

map <Leader>p :set paste<CR>"*p:set nopaste<CR>
map <Leader>o o<ESC>
map <leader>O O<ESC>

" Window moves
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>
" =>> Complicated stuff?
" =>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif


