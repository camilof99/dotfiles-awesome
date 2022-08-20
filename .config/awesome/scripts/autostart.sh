#!/bin/sh
#!/usr/bin/env bash
#!/usr/bin/python
#!/bin/env bash

# Launch Apps when AwesomeWM starts.

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

# List the apps you wish to run on startup below preceded with "run"

# Policy kit (needed for GUI apps to ask for password)
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# xrandr layout for AwesomeWM
run ~/.scripts/awesome/awe#!/usr/bin/env bash

# Policy kit (needed for GUI apps to ask for password)
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# sxhkd Hotkeys
#run sxhkd &
# Start compositor
picom &
# Nitrogen wallpaper
run nitrogen --restore &
# pywal
wal -R &
# Start Volume Control applet
run volctl &
# Start Network Manager Applet
run nm-applet &
# Set Numlock key to active.
run numlockx &
# Start Guake terminal
run guake &
# Greenclip for Rofi
run greenclip daemon &
# Pamac system update notifications
run pamac-tray &
# Unclutter - (hides mouse pointer after 5 seconds of inactivity)
run unclutter &
# Start Volume Control applet
run volctl &
# Start Guake terminal
run guake &
# Greenclip for Rofi
run greenclip daemon &
# Pamac system update notifications
run pamac-tray &
# MPD
run mpd ~/.config/mpd/mpd.conf &
