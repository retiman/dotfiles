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
  git branch --no-color 2> /dev/null |
  sed -e '/^[^*]/d' -e "s/* \(.*\)/\(\1$(repo::dirty)\)/"
}

# Returns an asterisk if the branch you are on is dirty (has changes).
function repo::dirty() {
  M1="nothing to commit, working tree clean"
  M2="nothing to commit (working directory clean)"
  STATUS=$(git status 2> /dev/null | tail -n1)
  [[ $STATUS != $M1 && $STATUS != $M2 ]] && echo '*'
}

