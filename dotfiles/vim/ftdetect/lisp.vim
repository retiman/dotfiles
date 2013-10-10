autocmd BufNewFile,BufRead *.scm,*.rkt setf scheme
autocmd FileType lisp,scheme,racket,art setlocal equalprg=indent-lisp
