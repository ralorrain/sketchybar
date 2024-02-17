#!/usr/bin/env bash

volume_slider=(
  script="$PLUGIN_DIR/volume.sh"
  updates=on
  icon.drawing=off
  label.drawing=off
  slider.highlight_color="$VOLUME_SLIDER_HIGHLIGHT_COLOR"
  slider.background.height=5
  slider.background.corner_radius=3
  slider.background.color="$VOLUME_SLIDER_COLOR"
  slider.knob="$VOLUME_SLIDER_KNOB"
  slider.knob.drawing=on
  background.padding_left=0
  background.padding_right=0
)

volume_icon=(
  width=dynamic
  click_script="$PLUGIN_DIR/volume_click.sh"
  icon.color="$VOLUME_ICON_COLOR"
  icon.font="$VOLUME_ICON_FONT"
  label.width=20
)

volume() {
  sketchybar --add slider volume "$1"           \
             --set volume "${volume_slider[@]}" \
             --subscribe volume volume_change   \
                                mouse.clicked   \
                                                \
             --add item volume_icon "$1"        \
             --set volume_icon "${volume_icon[@]}"
}

