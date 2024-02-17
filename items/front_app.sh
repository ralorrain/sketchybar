#!/usr/bin/env bash

# shellcheck disable=SC2016
FRONT_APP_SCRIPT='[ "$SENDER" = "front_app_switched" ] && sketchybar --set $NAME label="$INFO"'

front_app=(
  icon="$FRONT_APP"
  icon.font="$FRONT_APP_ICON_FONT"
  icon.color="$FRONT_APP_ICON_COLOR"
  label.font="$FRONT_APP_LABEL_FONT"
  label.color="$FRONT_APP_LABEL_COLOR"
  associated_display=active
  script="$FRONT_APP_SCRIPT"
)

front_app() {
  sketchybar --add item front_app "$1" \
             --set front_app "${front_app[@]}" \
             --subscribe front_app front_app_switched
}
