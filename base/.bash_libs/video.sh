function video::mute {
  for F in "$@"; do
    mencoder "$F" -ovc copy -nosound -o "/tmp/muted-$F"
    mv "/tmp/muted-$F" "$F"
  done
}

function video::any2mkv {
  for F in "$@"; do
    ffmpeg -i "$F" -vcodec libx264 -preset slow -crf 22 -acodec libmp3lame -aq 4 "$F.mkv"
  done
}

function video::any2mp3 {
  for F in "$@"; do
    ffmpeg -i "$F" -ab 131072 -ar 44100 "$F.mp3"
  done
}

function video::any2img {
  for F in "$@"; do
    ffmpeg -i "$F" -r 1 -s 640x480 -f image2 "${F%.*}-%03d.jpg"
  done
}

