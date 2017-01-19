# Set keyboard delay/rate.
xset r rate 275 30

# Turn off the beep.
xset -b

# Swap caps lock, make windows key an additional control.
# See: https://gist.github.com/retiman/6b7da5f9868cf12435b3
setxkbmap -option ctrl:swapcaps

# Make the MicroSoft Windows button on mouse behave as a back button in Chrome.
# This unsets Super_R and maps it to some non-existent button (F13), which in
# xbindkeys sends a fake back request.
xmodmap -e 'remove mod4 = Super_R'
xmodmap -e 'keycode 134 = F13'
xset -r 134

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
