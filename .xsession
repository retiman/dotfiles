# Set keyboard delay/rate.
xset r rate 275 30

# Turn off the beep.
xset -b

# Swap capslock and control.
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
xset m 1.0 0

# Enable vertical scrolling for trackpoint.
#xinput set-int-prop 'TPPS/2 IBM TrackPoint' 'Evdev Wheel Emulation' 8 1
#xinput set-int-prop 'TPPS/2 IBM TrackPoint' 'Evdev Wheel Emulation Button' 8 2

# Enable horizontal scrolling for trackpoint.
#xinput set-int-prop 'TPPS/2 IBM TrackPoint' 'Evdev Wheel Emulation Axes' 8 6 7 4 5

# The PRIMARY selection is used to track currently selected text; middle click
# is typically used to paste the selected text somewhere.
# The CLIPBOARD selection is used as temporary storage when an application
# explicitly copies something into thatt selection (via ctrl+c, for example).
#
# See: http://www.nongnu.org/autocutsel/
#
# The following syncs the CLIPBOARD with the PRIMARY selection (when you press
# ctrl+c to copy something in Chrome, the PRIMARY selection is updated so you can
# press middle click to paste).
#autocutsel -fork -selection CLIPBOARD -buttonup -pause 1000 &

# The following syncs the PRIMARY with the CLIPBOARD (when you select something
# with the mouse, you can press ctrl+v to paste).
#
# One issue with this synchronization is if you ctrl+c to copy a URL, and then
# click in the Location bar of the browser to ctrl+v paste it.  The browser
# will select the URL already in the Location bar right away, and your ctrl+v
# will paste the URL that was already there.  To remedy this, a short 1 second
# delay is added before the selection is owned.
#autocutsel -fork -selection PRIMARY -buttonup -pause 1000 &

# Set a wallpaper!
#[ -e $HOME/data/wallpaper.jpg ] && feh --bg-scale $HOME/data/wallpaper.jpg

# If using .xinitrc, this file will not be read by default, so read merge
# it here.
#
# See: https://wiki.archlinux.org/index.php/X_resources
#[ -e $HOME/.Xresources ] && xrdb $HOME/.Xresources

# Source xkbindkeys if it exists.  Use this file to simulate fiddling with the
# multimedia keys if they are not recognized by default.
#
# See: https://wiki.archlinux.org/index.php/Xbindkeys
[ -e $HOME/.xbindkeysrc ] && xbindkeys -f $HOME/.xbindkeysrc

# Display and screensaver settings.
#xset -dpms
#xset s off
#xscreensaver -nosplash &

# Launch urxvt in daemon mode.
#urxvtd -q -o -f

# Make looking at the screen at night easier on the eyes.
redshift -o -l 0:0 -b 0.9 -t 6500:6500

# Prepending exec is recommended as it replaces the current process with the
# process, so the script will stop running and X won't exit even if the process
# forks into the background.
#
# See: https://wiki.archlinux.org/index.php/Xinitrc
#exec dbus-launch /usr/bin/i3
