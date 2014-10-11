" Filename:      reporoot.vim
" Description:   Change directory to the nearest repository root directory
" Maintainer:    Jeremy Cantrell <jmcantrell@gmail.com>
" Last Modified: Sun 2011-05-08 15:56:35 (-0400)

if exists("g:reporoot_loaded")
    finish
endif

let g:reporoot_loaded = 1

let s:save_cpo = &cpo
set cpo&vim

function! s:RepoRoot(force, ...) "{{{1
    let dirbak = a:0 == 0 ? getcwd() : a:1
    if a:force
        let dirbak = fnamemodify(dirbak, ':h')
    endif
    let dir = GetRepoRoot(dirbak)
    execute 'cd '.dir
endfunction

function! s:GetFullPath(path) "{{{1
    return resolve(fnamemodify(expand(a:path), ':p'))
endfunction

function! IsRepo(dir) "{{{1
    for type in ['svn', 'git', 'hg', 'bzr']
        if isdirectory(a:dir.'/.'.type)
            return 1
        endif
    endfor
    return 0
endfunction

function! GetRepoRelative(path) "{{{1
    let root = GetRepoRoot(a:path)
    if len(root) == 0
        return a:path
    endif
    return substitute(s:GetFullPath(a:path), '^'.root.'/', '', '')
endfunction

function! GetRepoName(path) "{{{1
    return fnamemodify(GetRepoRoot(a:path), ':t')
endfunction

function! GetRepoRoot(path) "{{{1
    if a:path =~ '^fugitive:/'
        return '' " skip any fugitive buffers early
    endif
    let path = s:GetFullPath(a:path)
    if filereadable(path)
        let path = fnamemodify(path, ':h')
    endif
    if isdirectory(path.'/.svn')
        while 1
            let parent_path = fnamemodify(path, ':h')
            if ! isdirectory(parent_path.'/.svn') || parent_path == path
                break
            endif
            let path = parent_path
        endwhile
        return path
    else
        let prevpath = ''
        while 1
            if IsRepo(path)
                return path
            endif
            let path = fnamemodify(path, ':h')
            if path == prevpath
                return '' " path did not change (e.g. '/' or 'fugitive:/')
            endif
            let prevpath = path
        endwhile
    endif
endfunction

"}}}1

command! -nargs=? -bang RepoRoot call s:RepoRoot(strlen('<bang>'), <f-args>)

let &cpo = s:save_cpo
