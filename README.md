Homekeeper
==========
These are my PERSONAL dot files!

Usage
=====
Run `bin/homekeeper` in the source root to symlink your dotfiles and scripts
into your home directory.  It will overwrite stuff that's already there but
stick the overwritten files in tmp for you to review.

Each branch is for a different machine that I use.  If I make a change on one
machine, I cherry pick that commit into master, and merge master into the
other branches when I use that machine.

Here is some example output:

<pre>
[minhuang@mocha:homekeeper(mocha)]$ bin/homekeeper
Symlinking bin files
Symlinked: /home/minhuang/bin/mvn-show
Symlinked: /home/minhuang/bin/sbt
Symlinked: /home/minhuang/bin/clj
Symlinked: /home/minhuang/bin/clojure
Symlinked: /home/minhuang/bin/pushkey
Symlinked: /home/minhuang/bin/gbp-builder
Symlinked: /home/minhuang/bin/netbeans
Symlinked: /home/minhuang/bin/scala
Symlinked: /home/minhuang/bin/loc
Symlinked: /home/minhuang/bin/lein
Symlinked: /home/minhuang/bin/rs
Symlinked: /home/minhuang/bin/define
Symlinked: /home/minhuang/bin/tc
Symlinked: /home/minhuang/bin/metacafe-dl
Symlinked: /home/minhuang/bin/tree
Symlinked: /home/minhuang/bin/mvn-deploy
Symlinked: /home/minhuang/bin/ng-server
Symlinked: /home/minhuang/bin/homekeeper
Symlinking dot files
Symlinked: /home/minhuang/.gemrc
Symlinked: /home/minhuang/.synergy.conf
Symlinked: /home/minhuang/.devscripts
Symlinked: /home/minhuang/.ctags
Symlinked: /home/minhuang/.toprc
Symlinked: /home/minhuang/.gitignore
Symlinked: /home/minhuang/.tpbrc
Symlinked: /home/minhuang/.gntrc
Symlinked: /home/minhuang/.gitk
Symlinked: /home/minhuang/.gvimrc
Symlinked: /home/minhuang/.bash_functions
Symlinked: /home/minhuang/.dircolors
Symlinked: /home/minhuang/.vim
Symlinked: /home/minhuang/.vimprojects
Symlinked: /home/minhuang/.gbp.conf
Symlinked: /home/minhuang/.xinitrc
Symlinked: /home/minhuang/.vimrc
Symlinked: /home/minhuang/.kderc
Symlinked: /home/minhuang/.screenrc
Symlinked: /home/minhuang/.Xmodmap
Symlinked: /home/minhuang/.bash_profile
Symlinked: /home/minhuang/.pbuilderrc
Symlinked: /home/minhuang/.irbrc
Symlinked: /home/minhuang/.bash_aliases
Symlinked: /home/minhuang/.Xdefaults
Symlinked: /home/minhuang/.gtkrc-2.0
Symlinked: /home/minhuang/.gitconfig
Symlinked: /home/minhuang/.wmii
Done
</pre>
