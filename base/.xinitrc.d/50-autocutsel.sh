# The PRIMARY selection is used to track currently selected text; middle click
# is typically used to paste the selected text somewhere.
# The CLIPBOARD selection is used as temporary storage when an application
# explicitly copies something into that selection (via ctrl+c, for example).
#
# See: http://www.nongnu.org/autocutsel/
#
# The following syncs the CLIPBOARD with the PRIMARY selection (when you press
# ctrl+c to copy something in Chrome, the PRIMARY selection is updated so you can
# press middle click to paste).
autocutsel -fork -selection CLIPBOARD -buttonup -pause 2000 &

# The following syncs the PRIMARY with the CLIPBOARD (when you select something
# with the mouse, you can press ctrl+v to paste).
#
# One issue with this synchronization is if you ctrl+c to copy a URL, and then
# click in the Location bar of the browser to ctrl+v paste it.  The browser
# will select the URL already in the Location bar right away, and your ctrl+v
# will paste the URL that was already there.  To remedy this, a short 1 second
# delay is added before the selection is owned.
autocutsel -fork -selection PRIMARY -buttonup -pause 2000 &

