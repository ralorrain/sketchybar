#!/usr/bin/env bash

calendar=(
  width=dynamic
  label.font="$CALENDAR_LABEL_FONT"
  label.color="$CALENDAR_LABEL_COLOR"
  update_freq=30
  script="$PLUGIN_DIR/calendar.sh"
  click_script="open -a \"Calendar\";"
)

calendar() {
  sketchybar --add item calendar "$1"        \
             --set calendar "${calendar[@]}" \
             --subscribe calendar system_woke
}
