" This file contains my personal preferences that override anything that strange
" ftplugins like to enable.  I'd like to mostly enable ftplugins, but then
" override anything I don't like.  Since there is no global override, I have
" to manually override options for every file.
"
" Here's how I generated the files in ~/.vim/after/ftplugin:
"
" cd ~/.vim/after/ftplugin
" for file in /usr/share/vim/vim74/ftplugin/*.vim
" do
"   ln -s ../after.vim `basename $file`
" done
"
" See: http://peox.net/articles/vimconfig.html
" See: http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
setlocal formatoptions-=c
setlocal formatoptions-=t
setlocal textwidth=0
