#!/usr/bin/env bash

source "$CONFIG_DIR/theme.sh"

OUTDATED=$(brew outdated --json | grep -c 'pinned": false')

ICON_COLOR=$SYSTEM_BREW_NORMAL_ICON_COLOR
LABEL_COLOR=$SYSTEM_BREW_NORMAL_LABEL_COLOR
BACKGROUND_COLOR=$SYSTEM_BREW_NORMAL_BACKGROUND_COLOR
BACKGROUND_BORDER_COLOR=$SYSTEM_BREW_NORMAL_BACKGROUND_BORDER_COLOR

update() {
  case "$OUTDATED" in
    0)
    ;;
    [1-9])
    ;;
    1[0-9])
    ;;
    [2-4][0-9]) ICON_COLOR=$SYSTEM_BREW_WARNING_ICON_COLOR
                LABEL_COLOR=$SYSTEM_BREW_WARNING_LABEL_COLOR
                BACKGROUND_COLOR=$SYSTEM_BREW_WARNING_BACKGROUND_COLOR
                BACKGROUND_BORDER_COLOR=$SYSTEM_BREW_WARNING_BACKGROUND_BORDER_COLOR
    ;;
    *)          ICON_COLOR=$SYSTEM_BREW_CRITICAL_ICON_COLOR
                LABEL_COLOR=$SYSTEM_BREW_CRITICAL_LABEL_COLOR
                BACKGROUND_COLOR=$SYSTEM_BREW_CRITICAL_BACKGROUND_COLOR
                BACKGROUND_BORDER_COLOR=$SYSTEM_BREW_CRITICAL_BACKGROUND_BORDER_COLOR
    ;;
  esac

  sketchybar --set "$NAME" label="$OUTDATED"            \
                   icon.color="$ICON_COLOR"             \
                   label.color="$LABEL_COLOR"           \
                   background.color="$BACKGROUND_COLOR" \
                   background.border_color="$BACKGROUND_BORDER_COLOR"
}

clicked() {
  update
}

case "$SENDER" in
  "mouse.clicked") clicked
  ;;
  *) update
  ;;
esac
