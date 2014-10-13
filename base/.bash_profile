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
for F in id_dsa id_rsa; do
  if [ -f $HOME/.ssh/$F ]; then
    eval $(keychain --eval --agents ssh -Q --quiet $F)
  fi
  unset F
done

# Additional Bash Configuration
[ -f $HOME/.bash_aliases ] && source $HOME/.bash_aliases
[ -f $HOME/.bash_functions ] && source $HOME/.bash_functions
[ -f $HOME/.bash_local ] && source $HOME/.bash_local

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

