#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Set the default X cursor to the usual pointer
xsetroot -cursor_name left_ptr

# swap escpae with caps lock
setxkbmap -option caps:swapescape

# Set a nice background
feh --bg-fill --no-fehbg ~/.wp/wall.png

# Fire up screensaver
xscreensaver -no-splash &

# Power Management
xfce4-power-manager &

if [ -x /usr/bin/nm-applet ] ; then
   nm-applet --sm-disable &
fi
blueman-applet &

picom &

exec xmonad
