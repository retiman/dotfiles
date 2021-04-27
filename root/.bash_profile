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
