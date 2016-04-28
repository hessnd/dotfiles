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
Plugin 'kien/ctrlp.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdcommenter'
Plugin 'wincent/command-t'
Plugin 'sjl/badwolf'
Plugin 'tomtom/tcomment_vim'


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

" Show matching brackets when hovering over
set showmatch

" Color Scheme
colorscheme badwolf
let g:badwolf_darkgutter=1
set showcmd

" Turn Backkup off
set nobackup
set nowb
set noswapfile

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

set ai "Auto indent
set si "Smart indent

" Always Show current position
set ruler

"Window Management
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>h <C-W>h
map <leader>l <C-W>l
map <leader>s <C-W>s
map <leader>v <C-W>v
map <leader>+ <C-W>>
map <leader>- <C-W>>

" Complete brackets and parentheses
inoremap {     {}<Left>
inoremap {<CR> {<CR}<Esc>O
inoremap {{    {
inoremap {}    {}
inoremap (     ()<Left>

" Nerd Tree shortcuts
map <leader>\ :NERDTreeToggle<cr>

" CtrlP Settings
let g:ctrlp_working_path_mode = 'ra'

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
