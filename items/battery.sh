#!/usr/bin/env bash

battery=(
  script="$PLUGIN_DIR/battery.sh"
  icon.font="$BATTERY_ICON_FONT"
  padding_right=5
  padding_left=0
  label.drawing=off
  update_freq=120
  updates=on
)

battery() {
  sketchybar --add item battery "$1"       \
             --set battery "${battery[@]}" \
             --subscribe battery power_source_change system_woke
}
