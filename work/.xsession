# Set keyboard delay/rate.
xset r rate 275 30

# Turn off the beep.
xset -b

# Swap caps lock, make windows key an additional control.
# See: https://gist.github.com/retiman/6b7da5f9868cf12435b3
setxkbmap -option ctrl:swapcaps

# Turn off the damned touchpad.
synclient TouchpadOff=1

# Set mouse acceleration.  Acceleration defines how much faster than the default
# speed the moue will move.  The threshold is the velocity required before
# acceleration will become effective, usually measured in device units per 10ms.
#
# Setting threshold allows for slow, precise movement in a small range while
# still allowing the pointer to move across the screen with a flick of the
# wrist.
#
# The manpage suggests setting acceleration to 3/2 to 3 when threshold is 0.
#
# See: https://wiki.archlinux.org/index.php/Mouse_acceleration
xset m 2.0 0

# If using .xinitrc, this file will not be read by default, so load it.
#
# See: https://wiki.archlinux.org/index.php/X_resources
[ -e $HOME/.Xresources ] && xrdb $HOME/.Xresources

# Source .xkbindkeys if it exists.  Use this file to simulate fiddling with the
# multimedia keys if they are not recognized by default.
#
# See: https://wiki.archlinux.org/index.php/Xbindkeys
[ -e $HOME/.xbindkeysrc ] && xbindkeys -f $HOME/.xbindkeysrc

# Source additional configuration.
if [ -d $HOME/.xinitrc.d/ ]; then
  for F in $HOME/.xinitrc.d/?*.sh; do
    [ -x "$F" ] && source "$F"
  done
  unset F
fi

# Prepending exec is recommended as it replaces the current process with the
# process, so the script will stop running and X won't exit even if the process
# forks into the background.
#
# See: https://wiki.archlinux.org/index.php/Xinitrc
if [ -f $HOME/.i3local.conf ]; then
  cat $HOME/.i3/i3base.conf $HOME/.i3local.conf > $HOME/.i3/config
else
  cat $HOME/.i3/i3base.conf > $HOME/.i3/config
fi
exec dbus-launch /usr/bin/i3
