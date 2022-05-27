" How to use retiman's flavor of vim with plugins 'o plenty
" =========================================================
" A note about setting mouse=a: it turns out you can't copy and paste symbols
" like ツ with mouse=a unless you hold shift while selecting with the mouse
" or hold shift when pasting (alternatively you can disable mouse=a).
"
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
set hlsearch
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
set nosmartindent
set noswapfile
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
set visualbell
set wildmenu
set wildchar=<tab>
set wildignore=*.swp,*.swo,*~
set wildmode=list:longest
set wrapmargin=0

let mapleader=','
let s:color_column=0

syntax on
filetype on
filetype plugin on
filetype indent on

" Normal, visual, and operator-pending mode mappings.
noremap <tab> %
noremap ; :
noremap H <nop>
noremap J <nop>
noremap K <nop>
noremap L <nop>
noremap j gj
noremap k gk
noremap q <nop>

" Normal mode mappings.
nnoremap <c-g> <c-]>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-n> gt<cr>
nnoremap <c-p> gT<cr>
nnoremap <leader>l :set list!<cr>
nnoremap <leader>n :set number!<cr>
nnoremap <leader>q :qa!<cr>

" Visual mode and selection mode mappings.
vnoremap < <gv
vnoremap > >gv

set secure
