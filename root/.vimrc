" How to use retiman's flavor of vim with plugins 'o plenty
" =========================================================
" CamelCaseMotion
"   <leader>w moves forward one word
"   <leader>b moves backwards one word
" ctrlp
"   <c-t> opens file list
"   <F5> refreshes an open file list
" vim-reporoot
"   :RepoRoot goes to the repository's root
"
" A note about setting mouse=a: it turns out you can't copy and paste symbols
" like ツ with mouse=a unless you hold shift while selecting with the mouse
" or hold shift when pasting (alternatively you can disable mouse=a).
"
" A note about accessing the clipboard over SSH: make sure to have X11
" forwarding turned on and use ,y/,p to yank and paste over a remote session.
"
" A note about colors: install rxvt-unicode-256color or another terminal with
" 256 color support or jellybeans colorscheme will look really bad.
"
" A note about figuring out different plugin interactions: you can type map,
" imap, xmap, cmap, etc. by themselves to have Vim show you the different
" mappings that have been set.  Some roguish plugins may like to play around
" with your mappings without asking you first, so be sure to check.

" These set directives must be set first.
set nocompatible
set clipboard=unnamed,unnamedplus
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" These set directives can be listed in any order.
set autochdir
set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set cmdheight=2
set colorcolumn=81
set complete=.,w,b,t,i
set completeopt=longest,menuone
set copyindent
set cursorline
set display+=lastline
set expandtab
set fileformat=unix
set fillchars=stl:\ ,stlnc:\
set formatoptions-=c
set formatoptions-=t
set gdefault
set guioptions+=c
set hidden
set history=50
set incsearch
set ignorecase
set indentexpr=
set infercase
set laststatus=2
set lazyredraw
set list
set listchars=tab:│\ ,trail:·
set modelines=0
set mouse=
set mousemodel=popup
set nobackup
set nocindent
set noerrorbells
set nofoldenable
set nohlsearch
set nosmartindent
set noswapfile
set novisualbell
set number
set pastetoggle=<f1>
set ruler
set scrolloff=15
set selection=inclusive
set shiftwidth=2
set shiftround
set showcmd
set showmode
set showmatch
set smartcase
set smarttab
set softtabstop=2
set t_vb=
set tabstop=2
set tags=.tags;
set textwidth=0
set title
set ttyfast
set undofile
set undodir=/tmp
set viminfo='10,\"100,:20,n~/.viminfo
set wildmenu
set wildchar=<tab>
set wildignore=*.swp,*.swo,*~
set wildmode=list:longest
set wrapmargin=0

let mapleader=','

syntax on
filetype on
filetype plugin on
filetype indent on

colorscheme jellybeans
highlight link bufferline_selected_inactive airline_c_inactive

" Normal, visual, and operator-pending mode mappings.
noremap <tab> %
noremap ; :
noremap E :Explore<cr>
noremap H <nop>
noremap J <nop>
noremap K <nop>
noremap L <nop>
noremap j gj
noremap k gk
noremap q <nop>
noremap <silent> <leader>y :w !pbcopy<cr><cr>

" Command mode mappings.
cnoremap w!! w !sudo tee % >/dev/null

" Normal mode mappings.
nnoremap <c-g> <c-]>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-n> gt<cr>
nnoremap <c-p> gT<cr>
nnoremap <leader>cd :lcd %:p:h<cr>:pwd<cr>|       " Change to directory of file
nnoremap <leader>cpr :CtrlPClearCache<cr>
nnoremap <leader>ctc :RepoRoot<cr>:!ctags -f .tags -R .<cr>
nnoremap <leader>d :bd<cr>:syn on<cr>
nnoremap <leader>l :set list!<cr>
nnoremap <leader>n :set number!<cr>
nnoremap <leader>re :res<cr>
nnoremap <leader>rr :RepoRoot<cr>:pwd<cr>
nnoremap <leader>p :r !pbpaste<cr>
nnoremap <leader>q :qa!<cr>
nnoremap <silent> <leader>ws :let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar>:nohl<cr>
nnoremap <leader>= <c-w>=<cr>
nnoremap <leader>/ :set hlsearch!<cr>
nnoremap gb <c-T>|                                " Jump back from ctags def
nnoremap gd <c-]>|                                " Jump to ctags def
nnoremap gt <c-w><c-]><c-w>T|                     " Jump to ctags def in new tab
nnoremap gl g]|                                   " Open tag list from def

" Visual mode and selection mode mappings.
vnoremap < <gv
vnoremap > >gv

set secure
