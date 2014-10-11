# Changes to the root directory of your git repository.  This must be a bash
# function; it cannot be a script.  Making it a script will change your cwd
# in the script, which will exit and accomplish nothing :)
function reporoot {
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

# Decompress a file, so I don't have to keep in mind the specific flags I have
# to pass in for each program that does decompression.  This will blow away
# the original compressed file if the decompression succeeds, so be warned.
function decompress {
  for F in "$@"; do
    case "$F" in
      *.tar.bz2)
        tar xvfj "$F"
        ;;
      *.tar.gz)
        tar xvfz "$F"
        ;;
      *.7z)
        7z x "$F"
        ;;
      *.exe)
        cabextract "$F"
        ;;
      *.gz)
        gunzip "$F"
        ;;
      *.rar)
        unrar x "$F"
        ;;
      *.xz)
        unxz "$F"
        ;;
      *.z01)
        zip -s 0 "${F%.*}.zip" --out "${F%.*}-full.zip"
        unzip "${F%.*}-full.zip"
        ;;
      *.zip)
        unzip "$F"
        ;;
      *.Z)
        uncompress "$F"
        ;;
      *)
        echo "Not a compressed file (that I know of)." ;;
    esac
  done
}

# Colorize man pages.
function man {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# Function for decrypting a file using AES; in case you wanted to use the file
# as a password store or something.
function decrypt {
  openssl enc -d -aes-256-cbc -salt -in "$1" -out "${1/.aes/}"
}

# Function for encrypting a file using AES; in case you wanted to use the file
# as a password store or something.
function encrypt {
  openssl enc -e -aes-256-cbc -salt -in "$1" -out "$1.aes"
}

# Functions for colorizing Bash prompt when working with Git or Mercurial
# repositories.
function gitparsedirty {
  MESSAGE="nothing to commit (working directory clean)"
  [[ $(git status 2> /dev/null | tail -n1) != $MESSAGE ]] && echo "*"
}

function repoparse {
  git branch --no-color 2> /dev/null |
  sed -e '/^[^*]/d' -e "s/* \(.*\)/\(\1$(gitparsedirty)\)/"
}

# Search your bash history for a command
function h {
  history | grep "$@"
}

# Colorize the Bash prompt the way I like it
function promptcolors {
  local BLUE="\[\033[0;34m\]"
  local RED="\[\033[0;31m\]"
  local GREEN="\[\033[0;32m\]"
  local WHITE="\[\033[1;37m\]"
  local CYAN="\[\033[0;36m\]"
  local PURPLE="\[\033[0;35m\]"
  local BROWN="\[\033[0;33m\]"
  local YELLOW="\[\033[1;33m\]"
  local LIGHT_BLUE="\[\033[1;30m\]"
  local LIGHT_RED="\[\033[1;31m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local LIGHT_GRAY="\[\033[0;37m\]"
  local LIGHT_CYAN="\[\033[1;36m\]"
  local LIGHT_PURPLE="\[\033[1;35m\]"
  local COLOR=$PURPLE
  PS1="$COLOR[\u@\h:\W$RED\$(repoparse)$COLOR]\$\[\033[0m\] "
  PS2='> '
  PS4='+ '
}

# Add a directory to PATH if it's not already there.  Adds it to the
# front of the PATH (uncomment to add to the end)
function addpath {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    #PATH="${PATH:+"$PATH:"}$1"
    PATH="$1:$PATH"
  fi
}

# Source a file only if it exists.
function include {
  [ -f "$1" ] && source "$1"
}

# Set up vim with a project file.
function vp {
  rr
  ln -s "$HOME/.vim/project/$1.vim" ./project.vim
}
