set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
"
" Let VUndle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tomtom/tcomment_vim'
Plugin 'ap/vim-css-color'
Plugin 'posva/vim-vue'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'wakatime/vim-wakatime'
Plugin 'w0ng/vim-hybrid'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'yggdroot/indentline'
Plugin 'mxw/vim-jsx'
Plugin 'w0rp/ale'
Plugin 'prettier/vim-prettier'
Plugin 'alampros/vim-styled-jsx'

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

" Syntax highlighting
syntax on

" Set Line Numbers
set number

" make backspace work like most other apps
set backspace=2

" Show matching brackets when hovering over
set showmatch

" Color Scheme
set background=dark
colorscheme hybrid
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
set showcmd

" Turn Backkup off
set nobackup
set nowb
set noswapfile

" Persistent Undo
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" Autocomplete Menu
set wildmenu
set wildmode=longest:list,full

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Make search act like search in modern browsers
set incsearch

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Keep 5 lines below and above the cursor
set scrolloff=3

" Fast saving
map <leader>w :w!<cr>
" Fast quitting
map <leader>q :q!<cr>

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

set autoindent "Auto indent
set smartindent "Smart indent

" Always Show current position
set ruler

"Reload files changed outside vim
set autoread

" Wrap lines at convenient points
set linebreak

"Window Management
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>h <C-W>h
map <leader>l <C-W>l
map <leader>s <C-W>s
map <leader>v <C-W>v
map <leader>+ <C-W>>
map <leader>- <C-W>>

" Open new splits easily
map vv <C-W>v
map ss <C-w>s
map Q <C-W>q

" Open splits on the right and below
set splitbelow
set splitright

" Load all buffers and prompt for number to go to
nnoremap gb :ls<CR>:b<Space>

autocmd VimResized * wincmd = " Automatically resize splits when resizing window

" Suffix .js for imports and using gf
set suffixesadd+=.js
set path+=$PWD/node_modules

" Automatically set correct Vue Syntax highlighting
autocmd FileType vue syntax sync fromstart

" Complete brackets and parentheses
inoremap {     {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{    {
inoremap {}    {}
inoremap (     ()<Left>

" Use Ctrl-c to copy and Ctrl-v to paste
vnoremap <C-c> :w !pbcopy<CR><CR>
noremap <C-v> :r !pbpaste<CR><CR>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind | to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" Nerd Tree shortcuts
map <leader>\ :NERDTreeToggle<cr>
" Close vim if Nerd Tree is the only thing left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" CtrlP Settings
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" tComment Settings
map <leader>/ gc

" NerdTree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Vim Airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_powerline_fonts=1

" Not have weird line of text at beginnning of fim in hyper terminal
set t_RV=

" Allow jsx syntax in js files
let g:jsx_ext_required = 0

" Ale settings
let g:ale_linters = {}
let g:ale_linters['javascript'] = ['eslint']
let g:ale_linters['jsx'] = ['eslint']
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['jsx'] = ['prettier']
let g:ale_fixers['scss'] = ['prettier']
let g:ale_fixers['css'] = ['prettier']
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --print-width 100'
let g:airline#extensions#ale#enabled = 1
let g:ale_fix_on_save = 1

" Prettier Settings
let g:prettier#config#print_width = 100
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'es5'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#parser = 'babylon'
