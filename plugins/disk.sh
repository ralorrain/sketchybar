#!/usr/bin/env bash

source "$CONFIG_DIR/theme.sh"

DISK=$(df -H | grep -E '^(/dev/disk3s5).' | awk '{ printf ("%s\n", $5) }' | cut -d "%" -f1)

UPDATE_FREQ=10
ICON_COLOR=$SYSTEM_DISK_NORMAL_ICON_COLOR
LABEL_COLOR=$SYSTEM_DISK_NORMAL_LABEL_COLOR
BACKGROUND_COLOR=$SYSTEM_DISK_NORMAL_BACKGROUND_COLOR
BACKGROUND_BORDER_COLOR=$SYSTEM_DISK_NORMAL_BACKGROUND_BORDER_COLOR

case "$DISK" in
  [0-9])
  ;;
  [1-5][0-9])
  ;;
  [6-7][0-9]) ICON_COLOR=$SYSTEM_DISK_WARNING_ICON_COLOR
              LABEL_COLOR=$SYSTEM_DISK_WARNING_LABEL_COLOR
              BACKGROUND_COLOR=$SYSTEM_DISK_WARNING_BACKGROUND_COLOR
              BACKGROUND_BORDER_COLOR=$SYSTEM_DISK_WARNING_BACKGROUND_BORDER_COLOR
  ;;
  *)          UPDATE_FREQ=1
              ICON_COLOR=$SYSTEM_DISK_CRITICAL_ICON_COLOR
              LABEL_COLOR=$SYSTEM_DISK_CRITICAL_LABEL_COLOR
              BACKGROUND_COLOR=$SYSTEM_DISK_CRITICAL_BACKGROUND_COLOR
              BACKGROUND_BORDER_COLOR=$SYSTEM_DISK_CRITICAL_BACKGROUND_BORDER_COLOR
  ;;
esac

sketchybar --set "$NAME" label="$DISK%"               \
                 update_freq="$UPDATE_FREQ"           \
                 icon.color="$ICON_COLOR"             \
                 label.color="$LABEL_COLOR"           \
                 background.color="$BACKGROUND_COLOR" \
                 background.border_color="$BACKGROUND_BORDER_COLOR"
