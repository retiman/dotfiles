function prompt::setup() {
  local COLOR=$1
  PS1="$COLOR[\u@\h:\W$COLOR_RED\$(repo::branch)$COLOR]\$$COLOR_NORMAL "
  PS2='> '
  PS4='+ '
}
