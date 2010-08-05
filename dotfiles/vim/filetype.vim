" bash
autocmd BufNewFile,BufRead .bash_profile,bash_profile setf sh
autocmd BufNewFile,BufRead .bash_functions,bash_functions setf sh
autocmd BufNewFile,BufRead .bash_aliases,bash_aliases setf sh

" html
autocmd BufNewFile,BufRead *.ejs setf html
autocmd BufNewFile,BufRead *.sst setf html

" java
autocmd BufWritePost .java silent! !ctags -a -R --exclude=target * &

" javascript
autocmd BufNewFile,BufRead *.js,*.jsm,*.json setf javascript
autocmd BufWritePost .js silent! !ctags -a -R * &

" nginx
autocmd BufNewFile,BufRead nginx setf nginx
autocmd BufNewFile,BufRead /etc/nginx/sites-enabled/* setf nginx

" ruby
autocmd BufNewFile,BufRead .irbrc setf ruby
autocmd BufWritePost .rb silent! !ctags -a -R * &

" scala
autocmd BufNewFile,BufRead *.scala setf scala
autocmd BufWritePost .scala silent! !ctags -a -R --exclude=target * &

" sh
autocmd BufNewFile,BufRead .pbuilderrc,pbuilderrc setf sh

" vimperator
autocmd BufNewFile,BufRead .vimperatorrc,vimperatorrc setf vimperator

" xml
autocmd BufNewFile,BufRead resin.conf setf xml
autocmd BufNewFile,BufRead *.xul setf xml
autocmd BufNewFile,BufRead *.rdf setf xml

" text
autocmd BufNewFile,BufRead *.md setf text

" comments
augroup comments
  autocmd FileType c,java,scala set comments=sr:/*,mb:*,el:*/,://
  autocmd FileType c,java,scala set formatoptions+=croql
augroup end
