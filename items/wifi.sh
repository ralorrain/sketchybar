#!/usr/bin/env bash

wifi=(
  icon.font="$WIFI_ICON_FONT"
  icon.color="$WIFI_ICON_COLOR"
  icon="$WIFI_DISCONNECTED"
  label.width=0
  label.font="$WIFI_LABEL_FONT"
  label.color="$WIFI_LABEL_COLOR"
  script="$PLUGIN_DIR/wifi.sh"
)

wifi() {
  sketchybar --add item wifi "$1"    \
             --set wifi "${wifi[@]}" \
             --subscribe wifi wifi_change mouse.clicked
}
