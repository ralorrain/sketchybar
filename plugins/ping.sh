#!/usr/bin/env bash

source "$CONFIG_DIR/theme.sh"

PING=$(ping -c 3 www.google.com | grep 'round-trip' | cut -d/ -f5 | xargs printf "%.0f\n")

UPDATE_FREQ=5
ICON_COLOR=$SYSTEM_PING_NORMAL_ICON_COLOR
LABEL_COLOR=$SYSTEM_PING_NORMAL_LABEL_COLOR
BACKGROUND_COLOR=$SYSTEM_PING_NORMAL_BACKGROUND_COLOR
BACKGROUND_BORDER_COLOR=$SYSTEM_PING_NORMAL_BACKGROUND_BORDER_COLOR

case "$PING" in
  [0-9])
  ;;
  [1-2][0-9])
  ;;
  [3-9][0-9]) ICON_COLOR=$SYSTEM_PING_WARNING_ICON_COLOR
              LABEL_COLOR=$SYSTEM_PING_WARNING_LABEL_COLOR
              BACKGROUND_COLOR=$SYSTEM_PING_WARNING_BACKGROUND_COLOR
              BACKGROUND_BORDER_COLOR=$SYSTEM_PING_WARNING_BACKGROUND_BORDER_COLOR
  ;;
  *)          ICON_COLOR=$SYSTEM_PING_CRITICAL_ICON_COLOR
              LABEL_COLOR=$SYSTEM_PING_CRITICAL_LABEL_COLOR
              BACKGROUND_COLOR=$SYSTEM_PING_CRITICAL_BACKGROUND_COLOR
              BACKGROUND_BORDER_COLOR=$SYSTEM_PING_CRITICAL_BACKGROUND_BORDER_COLOR
  ;;
esac

sketchybar --set "$NAME" label="${PING}ms"              \
                 update_freq="$UPDATE_FREQ"           \
                 icon.color="$ICON_COLOR"             \
                 label.color="$LABEL_COLOR"           \
                 background.color="$BACKGROUND_COLOR" \
                 background.border_color="$BACKGROUND_BORDER_COLOR"
