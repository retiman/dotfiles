# Colorize the Bash prompt the way I like it
function prompt::colorizewithgit() {
  local COLOR=$1
  PS1="$COLOR[\u@\h:\W$COLOR_RED\$(repo::branch)$COLOR]\$$COLOR_NORMAL "
  PS2='> '
  PS4='+ '
}

# WSL2 performance across filesystems is quite poor, so running git commands
# every time you get a prompt is slow as molasses.
function prompt::colorize() {
  local COLOR=$1
  PS1="$COLOR[\u@\h:\W]\$$COLOR_NORMAL "
  PS2='> '
  PS4='+ '
}
