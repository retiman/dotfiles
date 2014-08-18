# Environment Variables
export _JAVA_OPTION=
export ANT_OPTS='-Xms512M -Xmx1024M -XX:MaxPermSize=1024M'
export ANT_ARGS='-logger org.apache.tools.ant.listener.AnsiColorLogger'
export EDITOR=vim
export JAVA_HOME=/opt/java
export JDK_HOME=$JAVA_HOME
export GHCRTS='-K512M'
export GIT_EDITOR=vim
export HISTCONTROL=erasedups:ignoredups:ignorespace
export HISTIGNORE='ls:exit:rm'
export MAILCHECK=NO
export SVN_EDITOR=vim
export TERMINFO=$HOME/.terminfo
unset HISTSIZE
unset HISTFILESIZE

# Additional Shell Options
shopt -s checkwinsize
shopt -s extglob
shopt -s histappend

# Keychain
eval $(keychain --eval --agents ssh -Q --quiet id_dsa)
eval $(keychain --eval --agents ssh -Q --quiet id_rsa)

# Additional Bash Configuration
function include { [ -f "$1" ] && source "$1"; }
include $HOME/.bash_aliases
include $HOME/.bash_functions
include $HOME/.bash_local

# Additional PATHs
addpath $HOME/bin

# Color Options
eval $(dircolors $HOME/.dircolors)
promptcolors

# Add working directory to terminal title
case "$TERM" in
  xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
  ;;
    *)
  ;;
esac
