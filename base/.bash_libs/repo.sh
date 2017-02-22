# Changes to the root directory of your git repository.  This must be a bash
# function; it cannot be a script.  Making it a script will change your cwd
# in the script, which will exit and accomplish nothing :)
function repo::root() {
  pushd .
  while [ ! -d .git ]; do
    cd ..
    if [ $(pwd) = '/' ]; then
      echo 'Not in a git repo.' >&1
      popd
      return
    fi
  done
  popd
  cd -
}

# Returns the branch you are on, with an asterisk if the branch has changes.
function repo::branch() {
  local URL=$(svn info 2> /dev/null | awk '/URL:/ {print $2}')
  case "$URL" in
    */trunk)
      echo "(trunk$(repo::svndirty))"
      ;;
    */branches)
      echo "(branches$(repo::svndirty))"
      ;;
    */tags)
      echo "(tags$(repo::svndirty))"
      ;;
    *)
      git branch --no-color 2> /dev/null |
      sed -e '/^[^*]/d' -e "s/* \(.*\)/\(\1$(repo::gitdirty)\)/"
      ;;
  esac
}

# Returns an asterisk if the branch you are on is dirty (has changes).
function repo::gitdirty() {
  local M1="nothing to commit, working tree clean"
  local M2="nothing to commit (working directory clean)"
  local M3="nothing to commit, working directory clean"
  local STATUS=$(git status 2> /dev/null | tail -n1)
  [[ $STATUS != $M1 && $STATUS != $M2 && $STATUS != $M3 ]] && echo '*'
}

# Returns an asterisk if the branch you are on is dirty (has changes).
function repo::svndirty() {
  local STATUS=$(svn status | awk '/^(A|M|?)/')
  [[ ! -z $STATUS ]] && echo '*'
}
