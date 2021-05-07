# Environment Variables
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
export GIT_EDITOR=vim
export GIT_PAGER=cat git diff
export LESS="$LESS -Q -R"
export HISTCONTROL=erasedups:ignoredups:ignorespace
export HISTIGNORE='ls:exit:rm'
export MAILCHECK=NO
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
source "$HOME/.bash_functions.sh"
source "$HOME/.bash_aliases"

# Additional PATHs
addpath "$HOME/.local/bin"
addpath "$HOME/bin"

# Color Options
if type dircolors >/dev/null 2>&1; then
  eval $(dircolors "$HOME/.dircolors")
fi

# Source additional configuration.
[ -f "$HOME/.bash_local" ] && source "$HOME/.bash_local"
