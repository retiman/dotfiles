set et
set sw=2
set sts=2
set ts=2

map <F12> :wincmd n<CR>:exe ":0r!source ~/.bash_functions && find -type f -path './src/*' && find -type f -path './test/*'"<CR>1G:set buftype=nofile<CR>:res<CR>
