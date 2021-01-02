#!/bin/sh

# xinitrc runs automatically when you run startx.

# There are some small but important commands that need to be run when we start
# the graphical environment. I keep those commands in ~/config/xprofile because
# that file is run automatically if someone uses a display manager (login
# screen) and so they are needed there. To prevent doubling up commands, I
# source them here with the line below.

# export STATUSBAR="i3blocks" # Uncomment this line when using i3.

. ~/.xprofile

# Make Java applications aware this is a non-reparenting window manager.

# Set default cursor.

# Set keyboard repeat rate.

# Uncomment the following block to use the exwm-xim module.
#export XMODIFIERS=@im=exwm-xim
#export GTK_IM_MODULE=xim
#export QT_IM_MODULE=xim
#export CLUTTER_IM_MODULE=xim
# Your default LARBS WM is determined in your `~/.profile` on login.  Here we
# run the proper command to run when the graphical environment starts.

# Comment/uncomment these lines depending on what wm you want to use. Also
# check the i3blocks line above.
ssh-agent dwm
# ssh-agent i3
# ssh-agent sway
