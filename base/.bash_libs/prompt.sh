# Colorize the Bash prompt the way I like it
function prompt::colorize() {
  local COLOR=$1
  PS1="\[\033[G\]$COLOR[\u@\h:\W$COLOR_RED\$(repo::branch)$COLOR]\$\[\033[0m\] "
  PS2='> '
  PS4='+ '
}

