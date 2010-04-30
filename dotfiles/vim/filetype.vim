" bash
autocmd BufNewFile,BufRead .bash_profile,bash_profile setf sh
autocmd BufNewFile,BufRead .bash_functions,bash_functions setf sh
autocmd BufNewFile,BufRead .bash_aliases,bash_aliases setf sh

" html
autocmd BufNewFile,BufRead *.ejs setf html
autocmd BufNewFile,BufRead *.sst setf html

" javascript
autocmd BufNewFile,BufRead *.js.erb setf javascript
autocmd BufNewFile,BufRead *.js,*.jsm,*.json setf javascript

" ruby
autocmd BufNewFile,BufRead .irbrc setf ruby

" scala
autocmd BufNewFile,BufRead *.scala setf scala

" sh
autocmd BufNewFile,BufRead .pbuilderrc,pbuilderrc setf sh

" vimperator
autocmd BufNewFile,BufRead .vimperatorrc,vimperatorrc,*.vimp setf vimperator

" xml
autocmd BufNewFile,BufRead resin.conf,resin.conf.orig setf xml
autocmd BufNewFile,BufRead *.xul setf xml
autocmd BufNewFile,BufRead *.rdf setf xml
autocmd BufNewFile,BufRead *.rdf.erb setf xml

" text
autocmd BufNewFile,BufRead *.md setf text
