#!/usr/bin/env bash

update() {
  source "$CONFIG_DIR/theme.sh"
  BORDER_COLOR=$SPACES_BACKGROUND_BORDER_COLOR
  BACKGROUND_COLOR=$SPACES_BACKGROUND_COLOR
  if [ "$SELECTED" = "true" ]; then
    BORDER_COLOR=$SPACES_BACKGROUND_HIGHLIGHT_BORDER_COLOR
    BACKGROUND_COLOR=$SPACES_BACKGROUND_HIGHLIGHT_COLOR
  fi
  sketchybar --set "$NAME" icon.highlight="$SELECTED" \
                         label.highlight="$SELECTED" \
                         background.border_color="$BORDER_COLOR" \
                         background.color="$BACKGROUND_COLOR"
}

mouse_clicked() {
  if [ "$BUTTON" = "right" ]; then
    yabai -m space --destroy "$SID"
    sketchybar --trigger windows_on_spaces --trigger space_change
  else
    yabai -m space --focus "$SID" 2>/dev/null
  fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
