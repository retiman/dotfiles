# Converts MP3s so that they can be listened to on the Civic Hybrid 2006's
# super picky MP3 playing system.
function audio::any2hybrid() {
  for F in "$@"; do
    ffmpeg -i "$F" -acodec libmp3lame -ab 160k -ar 44100 -ac 2 /tmp/output.mp3
    mv /tmp/output.mp3 "${F%.*}.mp3"
    mv "${F%.*}.mp3" $(echo "$F" | sed -e 's/[^A-Za-z0-9._-]//g')
  done
}

function audio::yt2mp3() {
  youtube-dl --extract-audio --audio-format mp3 "$@"
}

