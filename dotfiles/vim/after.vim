" Well, it is quite rare that I get to say how retarded this solution is, but
" here I am, saying it.
"
" This file contains my personal preferences that override anything that strange
" ftplugins like to enable.  Mostly they are ok, but nobody wants automatic
" line wrapping, and if they do, then they are wrong.  End of story.
"
" Here's how I generated the files in ~/.vim/after/ftplugin:
"
" for file in /usr/share/vim/vim74/ftplugin/*.vim
" do
"   ln -s ~/.vim/after.vim ~/.vim/after/ftplugin/`basename $file`
" done
"
" Yup, that was pretty dumb.
"
" See: http://peox.net/articles/vimconfig.html
" See: http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
setlocal formatoptions-=c
setlocal formatoptions-=t
