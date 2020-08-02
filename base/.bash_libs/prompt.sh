# Colorize the Bash prompt the way I like it
function prompt::colorize() {
  local COLOR=$1
  PS1="$COLOR[\u@\h:\W$COLOR_RED\$(repo::branch)$COLOR]\$$COLOR_NORMAL "
  PS2='> '
  PS4='+ '
}

