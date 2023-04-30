#!/bin/bash
#entries="Performance-🔥 Balanced-☯ Power-saver-"

#selected=$(printf '%s\n' $entries | wofi --style=$HOME/.config/wofi/style.widgets.css --conf=$HOME/.config/wofi/config.screenshot | awk '{print tolower($1)}')
bright=$(brightnessctl | awk '{ print  $4 }' | grep % | cut -c -4 | cut -c 2- )
echo $bright
entries=" Brightness:$bright\n🔥 Performance\n☯ Balanced\n Power-saver"

selected=$(echo -e $entries|wofi --width 250 --height 210 --dmenu --cache-file /dev/null | awk '{print tolower($2)}')


case $selected in
  performance)
    powerprofilesctl set performance;;
  balanced)
    powerprofilesctl set balanced;;
  power-saver)
    powerprofilesctl set power-saver;;
esac
