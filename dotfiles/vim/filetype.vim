" all
autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\s\+$', -1)

" bash
autocmd BufNewFile,BufRead *.sh set filetype=bash
autocmd BufNewFile,BufRead .bash_profile,bash_profile set filetype=bash
autocmd BufNewFile,BufRead .bash_functions,bash_functions set filetype=bash
autocmd BufNewFile,BufRead .bash_aliases,bash_aliases set filetype=bash
autocmd BufNewFile,BufRead .bash_local,bash_local set filetype=bash

" hive
autocmd BufNewFile,BufRead *.q set filetype=hive

" java
autocmd FileType java setlocal completefunc=javacomplete#Complete
autocmd FileType java setlocal comments=sr:/*,mb:*,el:*/,://

" javascript
autocmd BufNewFile,BufRead *.js,*.jsm,*.json set filetype=javascript

" nginx
autocmd BufNewFile,BufRead nginx set filetype=nginx
autocmd BufNewFile,BufRead /etc/nginx/sites-enabled/* set filetype=nginx

" python
autocmd FileType python set completefunc=pythoncomplete#Complete

" ruby
autocmd BufNewFile,BufRead .irbrc set filetype=ruby

" scala
autocmd BufNewFile,BufRead *.scala set filetype=scala
autocmd FileType scala setlocal comments=sr:/*,mb:*,el:*/,://

" scheme
autocmd BufNewFile,BufRead *.scm,*.rkt setf scheme
autocmd FileType lisp,scheme,racket,art setlocal equalprg=indent-lisp

" xml
autocmd BufNewFile,BufRead resin.conf set filetype=xml
autocmd BufNewFile,BufRead *.xul set filetype=xml
autocmd BufNewFile,BufRead *.rdf set filetype=xml
