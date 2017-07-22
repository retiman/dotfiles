# Environment Variables
export _JAVA_OPTION=
export ANT_OPTS='-Xms512M -Xmx1024M -XX:MaxPermSize=1024M'
export ANT_ARGS='-logger org.apache.tools.ant.listener.AnsiColorLogger'
export COLOR_BLUE="\[\033[0;34m\]"
export COLOR_RED="\[\033[0;31m\]"
export COLOR_GREEN="\[\033[0;32m\]"
export COLOR_WHITE="\[\033[1;37m\]"
export COLOR_CYAN="\[\033[0;36m\]"
export COLOR_PURPLE="\[\033[0;35m\]"
export COLOR_BROWN="\[\033[0;33m\]"
export COLOR_YELLOW="\[\033[1;33m\]"
export COLOR_LIGHT_BLUE="\[\033[1;30m\]"
export COLOR_LIGHT_RED="\[\033[1;31m\]"
export COLOR_LIGHT_GREEN="\[\033[1;32m\]"
export COLOR_LIGHT_GRAY="\[\033[0;37m\]"
export COLOR_LIGHT_CYAN="\[\033[1;36m\]"
export COLOR_LIGHT_PURPLE="\[\033[1;35m\]"
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
if type keychain >/dev/null 2>&1; then
  for F in id_dsa id_rsa; do
    if [ -f "$HOME/.ssh/$F" ]; then
      keychain "$HOME/.ssh/$F"
    fi
  done
fi
eval $(keychain --eval -Q --quiet)

# Additional Bash Configuration
source "$HOME/.bash_libs/common.sh"
source "$HOME/.bash_libs/repo.sh"
source "$HOME/.bash_libs/prompt.sh"
source "$HOME/.bash_libs/audio.sh"
source "$HOME/.bash_libs/video.sh"
source "$HOME/.bash_aliases"
[ -f "$HOME/.bash_local" ] && source "$HOME/.bash_local"

# Additional PATHs
addpath "$HOME/bin"

# Color Options
if type dircolors >/dev/null 2>&1; then
  eval $(dircolors "$HOME/.dircolors")
fi

# Add working directory to terminal title
case "$TERM" in
  xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
  ;;
    *)
  ;;
esac
