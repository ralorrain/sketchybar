#!/usr/bin/env bash

source "$CONFIG_DIR/theme.sh"

CPU=$(top -l  2 | grep -E "^CPU" | tail -1 | awk '{ print $3 + $5 }' | cut -d "." -f1)

UPDATE_FREQ=10
ICON_COLOR=$SYSTEM_CPU_NORMAL_ICON_COLOR
LABEL_COLOR=$SYSTEM_CPU_NORMAL_LABEL_COLOR
BACKGROUND_COLOR=$SYSTEM_CPU_NORMAL_BACKGROUND_COLOR
BACKGROUND_BORDER_COLOR=$SYSTEM_CPU_NORMAL_BACKGROUND_BORDER_COLOR

case "$CPU" in
  [0-9])
  ;;
  [1-5][0-9])
  ;;
  [6-7][0-9]) UPDATE_FREQ=5
              ICON_COLOR=$SYSTEM_CPU_WARNING_ICON_COLOR
              LABEL_COLOR=$SYSTEM_CPU_WARNING_LABEL_COLOR
              BACKGROUND_COLOR=$SYSTEM_CPU_WARNING_BACKGROUND_COLOR
              BACKGROUND_BORDER_COLOR=$SYSTEM_CPU_WARNING_BACKGROUND_BORDER_COLOR
  ;;
  *)          UPDATE_FREQ=1
              ICON_COLOR=$SYSTEM_CPU_CRITICAL_ICON_COLOR
              LABEL_COLOR=$SYSTEM_CPU_CRITICAL_LABEL_COLOR
              BACKGROUND_COLOR=$SYSTEM_CPU_CRITICAL_BACKGROUND_COLOR
              BACKGROUND_BORDER_COLOR=$SYSTEM_CPU_CRITICAL_BACKGROUND_BORDER_COLOR
  ;;
esac

sketchybar --set "$NAME" label="$CPU%"                \
                 update_freq="$UPDATE_FREQ"           \
                 icon.color="$ICON_COLOR"             \
                 label.color="$LABEL_COLOR"           \
                 background.color="$BACKGROUND_COLOR" \
                 background.border_color="$BACKGROUND_BORDER_COLOR"
