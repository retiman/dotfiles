" These set directives must be set first.
set nocompatible
set clipboard=autoselect,unnamedplus
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

" See vim/bundle/vim-airline/autoload/airline/extensions for vim-bufferline
" configuration.
"
" Run `source ~/.vim/test/color_test.vim` to see what ctermbg colors to set
" so background colors aren't crazy grayish or light gray.  Set the
" g:jellybeans_background_color_256 value to 232 to get black (this will even
" work in tmux).
let mapleader=','

" Enable 256 colors if running inside tmux or screen, also disable background
" color erase.
"
" See: http://superuser.com/questions/508198/which-is-the-correct-way-to-config-the-term-and-tmux
if &term == 'screen'
  set t_Co=256
  set t_ut=
endif

syntax on

" Functions
function! RestoreCursor()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

function! ToggleColorColumn()
  if empty(&colorcolumn)
    setlocal colorcolumn=81
    echo 'colorcolumn=81'
  else
    setlocal colorcolumn=
    echo 'colorcolumn='
  endif
endfunction

function! ToggleMouse()
  if empty(&mouse)
    setlocal mouse=a
    echo 'mouse=a'
  else
    setlocal mouse=
    echo 'mouse='
  endif
endfunction

function! ToggleQuickFix()
  if g:quickfix_is_open
    cclose
    let g:quickfix_is_open=0
  else
    copen
    let g:quickfix_is_open=1
  endif
endfunction

" Normal, visual, and operator-pending mode mappings.
noremap <tab> %
noremap <silent> <F2> :call ToggleMouse()<cr>
noremap <silent> <F3> :call ToggleColorColumn()<cr>
noremap <silent> <F4> :call ToggleQuickFix()<cr>
noremap ; :
noremap E :Explore<cr>
noremap H <nop>
noremap J <nop>
noremap K <nop>
noremap L <nop>
noremap <silent> T :let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar>:nohl<cr>
noremap <silent> <leader>y :<c-u>call system('xclip -f -sel clip')<cr>
noremap j gj
noremap k gk

" Command mode mappings.
cnoremap w!! w !sudo tee % >/dev/null

" Normal mode mappings.
nmap <leader>x <plug>SlimeParagraphSend
nnoremap <c-g> <c-]>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-n> :bnext<cr>
nnoremap <c-p> :bprev<cr>
nnoremap <leader><tab> :Scratch<cr>
nnoremap <leader>, :Gstatus<cr>
nnoremap <leader>cc :lcd %:p:h<cr>:pwd<cr>
nnoremap <leader>d :bd<cr>:syn on<cr>
nnoremap <leader>l :set list!<cr>
nnoremap <leader>n :set number!<cr>
nnoremap <leader>re :res<cr>
nnoremap <leader>rr :RepoRoot<cr>:pwd<cr>
nnoremap <leader>sd :SDelete<cr>
nnoremap <leader>ss :SSave<cr>
nnoremap <silent> <leader>t :!ctags -R * &<cr><cr>
nnoremap <leader>p :r!xclip -o -sel clip<cr>
nnoremap <leader>q :qa!<cr>
nnoremap <leader>= <c-w>=<cr>
nnoremap <leader>/ :set hlsearch!<cr>

" Visual mode and selection mode mappings.
vnoremap < <gv
vnoremap > >gv

" Visual mode only mappings.
xmap <leader>x <plug>SlimeRegionSend

" Insert mode mappings
"   See: http://vim.wikia.com/wiki/Fix_arrow_keys_that_display_A_B_C_D_on_remote_shell
"   See: http://vim.wikia.com/wiki/Restoring_indent_after_typing_hash
inoremap # X#

" User commands
command Paste execute 'set paste | insert | set nopaste'

" Autocmds
autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\s\+$', -1)
autocmd BufWinEnter * call RestoreCursor()

" Project specific settings.
"   Include a project.vim in your repository root and Vim will source this file
"   to override any settings you want.
set secure
