# Add a directory to PATH if it's not already there.  Adds it to the
# front of the PATH (uncomment to add to the end)
function addpath {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    #PATH="${PATH:+"$PATH:"}$1"
    PATH="$1:$PATH"
  fi
}

# Function for decrypting a file using AES; in case you wanted to use the file
# as a password store or something.
function decrypt {
  openssl enc -d -aes-256-cbc -salt -in "$1" -out "${1/.aes/}"
}

# Decompress a file, so I don't have to keep in mind the specific flags I have
# to pass in for each program that does decompression.  This will blow away
# the original compressed file if the decompression succeeds, so be warned.
function common::decompress {
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

# Function for encrypting a file using AES; in case you wanted to use the file
# as a password store or something.
function encrypt {
  openssl enc -e -aes-256-cbc -salt -in "$1" -out "$1.aes"
}

# Search your bash history for a command
function h {
  history | grep "$@"
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

