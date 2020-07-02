function addpath() {
  PATH="$1:$PATH"
}

function decrypt() {
  openssl enc -d -aes-256-cbc -salt -in "$1" -out "${1/.aes/}"
}

function encrypt() {
  openssl enc -e -aes-256-cbc -salt -in "$1" -out "$1.aes"
}
