#!/usr/bin/env bash

SPACES_ICON_PADDING_LEFT=10
SPACES_ICON_PADDING_RIGHT=3
SPACES_LABEL_PADDING_LEFT=0
SPACES_LABEL_PADDING_RIGHT=15

spaces_bracket=(
  background.color="$SPACES_BACKGROUND_COLOR"
  background.border_color="$SPACES_BACKGROUND_BORDER_COLOR"
)

add_space=(
  icon="$ADD_SPACE"
  icon.color="$SPACES_ADD_SPACE_ICON_COLOR"
  icon.font="$SPACES_ICON_FONT"
  label.drawing=off
  associated_display=active
  click_script='yabai -m space --create && sketchybar --trigger space_change'
)

build_spaces() {
  sid=0
  for i in "${!SPACE_ICONS[@]}"
  do
    sid=$((i+1))

    COLOR="${!SPACES_COLORS[i]}"

    space=(
      associated_space="$sid"

      # Styling
      icon="${SPACE_ICONS[i]}"
      icon.font="$SPACES_ICON_FONT"
      icon.color="$COLOR"
      icon.highlight_color="$COLOR"
      label.font="$SPACES_LABEL_FONT"
      label.color="$COLOR"
      label.highlight_color="$COLOR"

      # Padding
      icon.padding_left="$SPACES_ICON_PADDING_LEFT"
      icon.padding_right="$SPACES_ICON_PADDING_RIGHT"
      label.padding_left="$SPACES_LABEL_PADDING_LEFT"
      label.padding_right="$SPACES_LABEL_PADDING_RIGHT"

      # Script
      script="$PLUGIN_DIR/spaces.sh"
    )

    sketchybar --add space space.$sid "$1"    \
               --set space.$sid "${space[@]}" \
               --subscribe space.$sid mouse.clicked
  done
}

spaces() {
  build_spaces "$1"
  sketchybar --add bracket spaces_bracket '/space\..*/'  \
             --set spaces_bracket "${spaces_bracket[@]}" \
                                                         \
             --add item add_space "$1"                   \
             --set add_space "${add_space[@]}"
}
