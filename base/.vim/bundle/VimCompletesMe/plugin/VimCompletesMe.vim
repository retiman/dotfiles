" VimCompletesMe.vim - Super simple tab completion
" Maintainer:          Akshay Hegde <http://github.com/ajh17>
" Version:             1.4
" Website:             <http://github.com/ajh17/VimCompletesMe>

" Vimscript Setup: {{{1
if exists("g:loaded_VimCompletesMe") || v:version < 703 || &compatible
  finish
endif
let g:loaded_VimCompletesMe = 1

" Options: {{{1
if !exists('g:vcm_s_tab_behavior')
  let g:vcm_s_tab_behavior = 0
endif
if !exists('g:vcm_direction')
  let g:vcm_direction = 'n'
endif
if !exists('g:vcm_default_maps')
  let g:vcm_default_maps = 1
endif
if !exists('g:vcm_omni_pattern')
  let g:vcm_omni_pattern = '\(\.\|\->\|::\)'
endif

" Functions: {{{1
function! s:vim_completes_me(shift_tab)
  let dirs = ["\<c-p>", "\<c-n>"]
  let dir = g:vcm_direction =~? '[nf]'
  let map = exists('b:vcm_tab_complete') ? b:vcm_tab_complete : ''

  if pumvisible()
    return a:shift_tab ? dirs[!dir] : dirs[dir]
  endif

  " Figure out whether we should indent.
  let pos = getpos('.')
  let substr = matchstr(strpart(getline(pos[1]), 0, pos[2]-1), "[^ \t]*$")
  if empty(substr)
    return (a:shift_tab && !g:vcm_s_tab_behavior) ? "\<C-d>" : "\<Tab>"
  endif

  let test_pattern = get(b:, 'vcm_omni_pattern', get(g:, 'vcm_omni_pattern'))
  let omni_pattern = match(substr, test_pattern) != -1
  let file_path = (has('win32') || has('win64')) ? '\\\|\/' : '\/'
  let file_pattern = match(substr, file_path) != -1

  if file_pattern
    return "\<C-x>\<C-f>"
  elseif omni_pattern && (!empty(&omnifunc))
    if get(b:, 'tab_complete_pos', []) == pos
      let exp = "\<C-x>" . dirs[!dir]
    else
      echo "Looking for members..."
      let exp = (!empty(&completefunc) && map ==? "user") ? "\<C-x>\<C-u>" : "\<C-x>\<C-o>"
    endif
    let b:tab_complete_pos = pos
    return exp
  endif

  " First fallback to keyword completion if special completion was already tried.
  if exists('b:completion_tried') && b:completion_tried
    let b:completion_tried = 0
    return "\<C-e>" . dirs[!dir]
  endif

  " Fallback
  let b:completion_tried = 1
  if map ==? "user"
    return "\<C-x>\<C-u>"
  elseif map ==? "omni"
    echo "Looking for members..."
    return "\<C-x>\<C-o>"
  elseif map ==? "vim"
    return "\<C-x>\<C-v>"
  else
    return dirs[!dir]
  endif
endfunction

inoremap <expr> <plug>vim_completes_me_forward  <sid>vim_completes_me(0)
inoremap <expr> <plug>vim_completes_me_backward <sid>vim_completes_me(1)

" Maps: {{{1
if g:vcm_default_maps
  imap <Tab>   <plug>vim_completes_me_forward
  imap <S-Tab> <plug>vim_completes_me_backward
endif

" Autocmds {{{1
augroup VCM
  autocmd!
  autocmd InsertEnter * let b:completion_tried = 0
  if v:version > 703 || v:version == 703 && has('patch598')
    autocmd CompleteDone * let b:completion_tried = 0
  endif
augroup END
