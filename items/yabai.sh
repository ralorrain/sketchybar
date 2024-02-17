#!/usr/bin/env bash

yabai=(
  icon.width=0
  icon.font="$YABAI_ICON_FONT"
  icon.color="$YABAI_ICON_COLOR"
  label.width=0
  label.font="$YABAI_LABEL_FONT"
  label.color="$YABAI_LABEL_COLOR"
  script="$PLUGIN_DIR/yabai.sh"
  associated_display=active
)

yabai() {
  sketchybar --add event window_focus                \
             --add event window_resized              \
             --add event windows_on_spaces           \
             --add item yabai "$1"                   \
             --set yabai "${yabai[@]}"               \
             --subscribe yabai window_focus          \
                               window_resized        \
                               space_change          \
                               windows_on_spaces     \
                               front_app_switched	   \
                               mouse.scrolled.global \
                               mouse.clicked
}
