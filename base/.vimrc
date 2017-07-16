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

" See vim/bundle/vim-airline/autoload/airline/extensions for vim-bufferline
" configuration.
"
" Run `source ~/.vim/test/color_test.vim` to see what ctermbg colors to set
" so background colors aren't crazy grayish or light gray.  Set the
" g:jellybeans_background_color_256 value to 232 to get black.
let mapleader=','
let g:airline#extensions#bufferline#overwrite_variables=0
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t:.'
let g:airline_exclude_preview=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_x='%{&ft} %{&fenc}'
let g:airline_section_y='fo=%{&fo} tw=%{&tw} l=%{&list}'
let g:airline_section_z='%3p%% %3l:%3c'
let g:airline_theme='jellybeans'
let g:autotagsTagsFile='.tags'
let g:csv_autocmd_arrange=1
let g:ctrlp_by_filename=1
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_lazy_update=1
let g:ctrlp_map='<c-t>'
let g:ctrlp_reuse_window='startify'
let g:ctrlp_root_markers=['project.vim', '.git']
let g:ctrlp_user_command=['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode='r'
let g:html_indent_inctags='html,body,head,tbody'
let g:html_indent_script1='inc'
let g:html_indent_style1='inc'
let g:jellybeans_background_color_256='232'
let g:pathogen_disabled=[]
let g:quickfix_is_open=0
let g:slime_default_config={'socket_name': 'default', 'target_pane': ':0.1'}
let g:slime_dont_ask_default=1
let g:slime_no_mappings=1
let g:slime_paste_file=tempname()
let g:slime_sessionname='main'
let g:slime_target='tmux'
let g:startify_change_to_vcs_root=1
let g:startify_custom_header='        Sup son? ( ¯\_(ツ)_/¯ )'
let g:startify_files_number=5
let g:startify_list_order=['dir', 'files', 'sessions']
let g:startify_session_autoload=0
let g:startify_session_dir='.git/vim-sessions'
let g:startify_session_persistence=1
let g:vcm_default_maps=0| "Disable default tab mappings for VCM
let s:color_column=0

" Enable 256 colors if running inside tmux or screen, also disable background
" color erase.
"
" See: http://superuser.com/questions/508198/which-is-the-correct-way-to-config-the-term-and-tmux
if &term == 'screen' || has('unix')
  set t_Co=256
  set t_ut=
endif

call pathogen#infect()
syntax on
filetype on
filetype plugin on
filetype indent on

colorscheme jellybeans
highlight link bufferline_selected_inactive airline_c_inactive

" Functions
function! RestoreCursor()
  " Restores cursor to where it used to be when the file was last opened.
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

function! ToggleColorColumn()
  " Shows a colorcolumn at max colorcolumn length.
    if s:color_column == 0
        let s:color_column=&colorcolumn
        set colorcolumn=0
    else
        let &colorcolumn=s:color_column
        let s:color_column_old=0
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
noremap ; :
noremap E :e .<cr>
noremap H <nop>
noremap J <nop>
noremap K <nop>
noremap L <nop>
noremap j gj
noremap k gk
noremap <silent> <leader>y :w !pbcopy<cr><cr>

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
nnoremap <leader>cc :call ToggleColorColumn()<cr>
nnoremap <leader>cd :lcd %:p:h<cr>:pwd<cr>|       " Change to directory of file
nnoremap <leader>cpr :CtrlPClearCache<cr>
nnoremap <leader>ctc :RepoRoot<cr>:!ctags -f .tags -R .<cr>
nnoremap <leader>d :bd<cr>:syn on<cr>
nnoremap <leader>l :set list!<cr>
nnoremap <leader>n :set number!<cr>
nnoremap <leader>re :res<cr>
nnoremap <leader>rr :RepoRoot<cr>:pwd<cr>
nnoremap <silent> <leader>tf :TestFile<cr>
nnoremap <silent> <leader>ts :TestSuite<cr>
nnoremap <silent> <leader>tt :TestNearest<cr>
nnoremap <leader>p :r !pbpaste<cr>
nnoremap <leader>q :call ToggleQuickFix()<cr>
nnoremap <silent> <leader>ws :let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar>:nohl<cr>
nnoremap <silent> <leader> y :.w !pbcopy<cr><cr>
nnoremap <leader>= <c-w>=<cr>
nnoremap <leader>/ :set hlsearch!<cr>
nnoremap gb <c-T>|                                " Jump back from ctags def
nnoremap gd <c-]>|                                " Jump to ctags def
nnoremap gt <c-w><c-]><c-w>T|                     " Jump to ctags def in new tab
nnoremap gl g]|                                   " Open tag list from def

" Visual mode and selection mode mappings.
vnoremap < <gv
vnoremap > >gv

" Visual mode only mappings.
xmap <leader>x <plug>SlimeRegionSend

" Insert mode mappings
"   See: http://vim.wikia.com/wiki/Fix_arrow_keys_that_display_A_B_C_D_on_remote_shell
"   See: http://vim.wikia.com/wiki/Restoring_indent_after_typing_hash
inoremap <expr> <esc> pumvisible() ?
    \ '<c-e>' . neocomplcache#smart_close_popup()
    \ : '<esc>'
inoremap <expr> <cr> pumvisible() ?
    \ '<c-n><c-y>'
    \ : '<cr>'
inoremap <expr> OB pumvisible() ?
    \ '<c-n>' : '<down>'
inoremap <expr> OA pumvisible() ?
    \ '<c-p>' : '<up>'
inoremap # X#

" User commands
command Paste execute 'set paste | insert | set nopaste'

" Autocmds
autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\s\+$', -1)
autocmd BufWinEnter * silent! call RestoreCursor()

" Project specific settings.
"   Include a project.vim in your repository root and Vim will source this file
"   to override any settings you want.
set secure
silent! source ./project.vim
