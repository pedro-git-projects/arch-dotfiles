#!/bin/bash

function run {
 if ! pgrep $1 ;
  then
    $@&
  fi
}

run "xrandr --auto --output HDMI-2 --mode 1920x1080 --rate 60  --left-of eDP-1"
run "nm-applet"
run "cbatticon"
run "xfce4-power-manager"
run "/usr/lib/xfce4/notifyd/xfce4-notifyd"
run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
picom --config ~/.config/dwm/picom.conf & 
run "numlockx on"
run "volctl"
run slstatus &
run "wmname LG3D"
run "unclutter"
run keepassxc &
run "/opt/ivpn/ui/bin/ivpn-ui"
run "feh --bg-fill $HOME/Pictures/wallpapers/samori.jpg --bg-fill $HOME/Pictures/wallpapers/samori.jpg"
# run setxkbmap us
# run "spotify-tray"
# run "blueman-applet"
