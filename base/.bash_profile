# Environment Variables
export _JAVA_OPTION=
export ANT_OPTS='-Xms512M -Xmx1024M -XX:MaxPermSize=1024M'
export ANT_ARGS='-logger org.apache.tools.ant.listener.AnsiColorLogger'
export COLOR_BLUE="\[\e[34m\]"
export COLOR_RED="\[\e[31m\]"
export COLOR_GREEN="\[\e[32m\]"
export COLOR_WHITE="\[\e[37m\]"
export COLOR_CYAN="\[\e[36m\]"
export COLOR_PURPLE="\[\e[35m\]"
export COLOR_BROWN="\[\e[33m\]"
export COLOR_YELLOW="\[\e[33m\]"
export COLOR_LIGHT_BLUE="\[\e[30m\]"
export COLOR_LIGHT_RED="\[\e[31m\]"
export COLOR_LIGHT_GREEN="\[\e[32m\]"
export COLOR_LIGHT_GRAY="\[\e[37m\]"
export COLOR_LIGHT_CYAN="\[\e[36m\]"
export COLOR_LIGHT_PURPLE="\[\e[35m\]"
export COLOR_NORMAL="\[\e[0m\]"
export EDITOR=vim
export GHCRTS='-K512M'
export GIT_EDITOR=vim
export HISTCONTROL=erasedups:ignoredups:ignorespace
export HISTIGNORE='ls:exit:rm'
export JAVA_HOME="$(readlink -f /usr/bin/javac | sed 's:bin/javac::')"
export JDK_HOME=$JAVA_HOME
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

# Additional Bash configuration
source "$HOME/.bash_libs/common.sh"
source "$HOME/.bash_libs/repo.sh"
source "$HOME/.bash_libs/prompt.sh"
source "$HOME/.bash_aliases"

# Additional PATHs
addpath "$HOME/.local/bin"
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

# Source additional configuration.
[ -f "$HOME/.bash_local" ] && source "$HOME/.bash_local"
