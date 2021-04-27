function addpath() {
  PATH="$1:$PATH"
}

function repo::branch() {
  git branch --no-color 2> /dev/null |
  sed -e '/^[^*]/d' -e "s/* \(.*\)/\(\1$(repo::dirty)\)/"
}

function repo::dirty() {
  local M1="nothing to commit, working tree clean"
  local M2="nothing to commit (working directory clean)"
  local M3="nothing to commit, working directory clean"
  local STATUS=$(git status 2> /dev/null | tail -n1)
  [[ $STATUS != $M1 && $STATUS != $M2 && $STATUS != $M3 ]] && echo '*'
}

function repo::origin() {
  git show-branch -a \
    | grep '\*' \
    | grep -v `git rev-parse --abbrev-ref HEAD` \
    | head -n1 \
    | sed 's/.*\[\(.*\)\].*/\1/' \
    | sed 's/[\^~].*//'
}

function repo::root() {
  pushd .
  while [[ ! -d .git ]] && [[ ! -d .svn ]]; do
    cd ..
    if [[ $(pwd) = '/' ]]; then
      echo 'Not in a git repo.' >&1
      popd
      return
    fi
  done
  popd
  cd -
}

function prompt::setup() {
  local COLOR=$1
  PS1="$COLOR[\u@\h:\W$COLOR_RED\$(repo::branch)$COLOR]\$$COLOR_NORMAL "
  PS2='> '
  PS4='+ '
}
