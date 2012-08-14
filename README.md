Homekeeper
==========
This project helps you keep your dot files and scripts under version control
in git.

The master branch holds my own dot files which you can use, but to version
control your own dotfiles, do this:

1.  Fork this project.
1.  Run `git merge initial` to completely blank out the master branch.
1.  Copy your dotfiles to `dotfiles` without the dot.  For example, copy your
    `.vimrc` to `dotfiles/vimrc`.
1.  Copy your scripts to `bin`.
1.  Run `bin/homekeeper link`.

This script will symlink your dotfiles and scripts into your home directory.
It will overwrite stuff that's already there but stick the overwritten files
in tmp for you to review.

Each branch is for a different machine that I use.  If I make a change on one
machine, I cherry pick that commit into master, and merge master into the
other branches when I use that machine.

Here is some example output:

<pre>
Symlinking bin files
Symlinked: /home/minhuang/bin/pushkey
Symlinked: /home/minhuang/bin/lein
Symlinked: /home/minhuang/bin/define
Symlinked: /home/minhuang/bin/homekeeper
Symlinking dot files
Symlinked: /home/minhuang/.gemrc
Symlinked: /home/minhuang/.ctags
Symlinked: /home/minhuang/.toprc
Symlinked: /home/minhuang/.gitignore
Symlinked: /home/minhuang/.i3status.conf
Symlinked: /home/minhuang/.tpbrc
Symlinked: /home/minhuang/.gntrc
Symlinked: /home/minhuang/.gitk
Symlinked: /home/minhuang/.gvimrc
Symlinked: /home/minhuang/.bash_functions
Symlinked: /home/minhuang/.dircolors
Symlinked: /home/minhuang/.vim
Symlinked: /home/minhuang/.gbp.conf
Symlinked: /home/minhuang/.xinitrc
Symlinked: /home/minhuang/.vimrc
Symlinked: /home/minhuang/.kderc
Symlinked: /home/minhuang/.screenrc
Symlinked: /home/minhuang/.bash_profile
Symlinked: /home/minhuang/.i3
Symlinked: /home/minhuang/.irbrc
Symlinked: /home/minhuang/.bash_aliases
Symlinked: /home/minhuang/.Xdefaults
Symlinked: /home/minhuang/.gtkrc-2.0
Symlinked: /home/minhuang/.gitconfig
Symlinked: /home/minhuang/.muttrc
Removing broken symlinks
</pre>
