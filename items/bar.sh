#!/usr/bin/env bash

DEFAULT_ICON_PADDING_LEFT=0
DEFAULT_ICON_PADDING_RIGHT=0
DEFAULT_LABEL_PADDING_LEFT=0
DEFAULT_LABEL_PADDING_RIGHT=0
DEFAULT_BACKGROUND_PADDING_LEFT=5
DEFAULT_BACKGROUND_PADDING_RIGHT=0

# Setting up the general bar appearance of the bar
bar=(
  height=45
  color="$BAR_COLOR"
  border_width=0
  shadow=off
  position=top
  sticky=on
  y_offset=-5
  topmost=window
)

# Setting up default values
defaults=(
  # Styling
  icon.font="$DEFAULT_ICON_FONT"
  icon.color="$DEFAULT_ICON_COLOR"
  label.font="$DEFAULT_LABEL_FONT"
  label.color="$DEFAULT_LABEL_COLOR"
  popup.background.color="$DEFAULT_POPUP_BACKGROUND_COLOR"
  popup.background.border_color="$DEFAULT_POPUP_BACKGROUND_BORDER_COLOR"
  popup.background.shadow.drawing=on

  # Sizing
  background.height=24
  background.corner_radius=7
  background.border_width=2
  popup.background.border_width=2
  popup.background.corner_radius=9
  popup.blur_radius=20

  #Padding
  y_offset=-2
  icon.padding_left="$DEFAULT_ICON_PADDING_LEFT"
  icon.padding_right="$DEFAULT_ICON_PADDING_RIGHT"
  label.padding_left="$DEFAULT_LABEL_PADDING_LEFT"
  label.padding_right="$DEFAULT_LABEL_PADDING_RIGHT"
  background.padding_left="$DEFAULT_BACKGROUND_PADDING_LEFT"
  background.padding_right="$DEFAULT_BACKGROUND_PADDING_RIGHT"

  # Script
  updates=when_shown
)

padding() {
  prev=$(sketchybar --query bar | grep "padding_$2" | sort | tail -n1 | tr -dc '0-9')
  [[ -z $prev ]] && number=1 || number=$((prev+1))
  sketchybar --add item padding_"$2"_"$number" "$1" \
             --set padding_"$2"_"$number"           \
                   icon=""                          \
                   icon.padding_left="$2"           \
                   icon.padding_right=0             \
                   label.padding_left=0             \
                   label.padding_right=0            \
                   background.padding_left=0        \
                   background.padding_right=0
}

separator() {
  prev=$(sketchybar --query bar | grep "separator" | sort | tail -n1 | tr -dc '0-9')
  [[ -z $prev ]] && number=1 || number=$((prev+1))
  sketchybar --add item separator_"$number" "$1"   \
             --set separator_"$number"             \
                   icon="$SEPARATOR"               \
                   icon.padding_right=5            \
                   icon.font="$BAR_SEPARATOR_FONT" \
                   icon.color="$BAR_SEPARATOR_COLOR"
}

sketchybar --bar "${bar[@]}"
sketchybar --default "${defaults[@]}"
