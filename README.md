Homekeeper
==========
This project contains my dotfiles, but it can also help you keep your dotfiles
and scripts under version control in git.  To take advantage of this project
for yourself, do this:

1.  Fork this project.
1.  Run `git merge initial` to completely blank out the master branch and
    start fresh (unless you like my dotfiles).
1.  Copy your dotfiles to `dotfiles` without the dot.  For example, copy your
    `.vimrc` to `dotfiles/vimrc`.
1.  Copy your scripts to `bin`.
1.  Run `bin/homekeeper link`.

This script will symlink your dotfiles and scripts into your home directory.
It will overwrite stuff that's already there but stick the overwritten files
in tmp for you to review.

Here is some example output for `homekeeper link`:

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

Multiple Computers
==================
If you have multiple computers or VMs you are working with, consider making a
branch for each one.  If you like a commit and want them to show up in all
branches, do this:

1.  `git commit -am "My super awesome change"`
1.  `git checkout master`
1.  `git cherry-pick commit-of-super-awesome-change`
1.  `git checkout my-branch`
1.  `git merge master`

Or you can run `homekeeper save` which will do the same thing with what HEAD
points to in the current branch.

If you are on a different computer or VM and want to pick up the changes
from master, do this:

1.  `git checkout master`
1.  `git pull origin master`
1.  `git checkout my-branch`
1.  `git merge master`

Or you can run `homekeeper sync` which will do the same thing.
