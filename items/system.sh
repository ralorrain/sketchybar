#!/usr/bin/env bash

SYSTEM_ICON_PADDING_LEFT=10
SYSTEM_ICON_PADDING_RIGHT=3
SYSTEM_LABEL_PADDING_LEFT=0
SYSTEM_LABEL_PADDING_RIGHT=10

cpu=(
  # Styling
  width=dynamic
  icon="$CPU_ICON"
  icon.font="$SYSTEM_CPU_ICON_FONT"
  label="?"
  label.font="$SYSTEM_CPU_LABEL_FONT"

  # Padding
  icon.padding_left="$SYSTEM_ICON_PADDING_LEFT"
  icon.padding_right="$SYSTEM_ICON_PADDING_RIGHT"
  label.padding_left="$SYSTEM_LABEL_PADDING_LEFT"
  label.padding_right="$SYSTEM_LABEL_PADDING_RIGHT"

  # Script
  script="$PLUGIN_DIR/cpu.sh"
  click_script="open -a \"Activity Monitor\""
)

mem=(
  # Styling
  width=dynamic
  icon="$MEM_ICON"
  icon.font="$SYSTEM_CPU_ICON_FONT"
  label="?"
  label.font="$SYSTEM_CPU_LABEL_FONT"

  # Padding
  icon.padding_left="$SYSTEM_ICON_PADDING_LEFT"
  icon.padding_right="$SYSTEM_ICON_PADDING_RIGHT"
  label.padding_left="$SYSTEM_LABEL_PADDING_LEFT"
  label.padding_right="$SYSTEM_LABEL_PADDING_RIGHT"

  # Script
  script="$PLUGIN_DIR/mem.sh"
  click_script="open -a \"Activity Monitor\""
)

disk=(
  # Styling
  width=dynamic
  icon="$DISK_ICON"
  icon.font="$SYSTEM_DISK_ICON_FONT"
  label="?"
  label.font="$SYSTEM_DISK_LABEL_FONT"

  # Padding
  icon.padding_left="$SYSTEM_ICON_PADDING_LEFT"
  icon.padding_right="$SYSTEM_ICON_PADDING_RIGHT"
  label.padding_left="$SYSTEM_LABEL_PADDING_LEFT"
  label.padding_right="$SYSTEM_LABEL_PADDING_RIGHT"

  # Script
  script="$PLUGIN_DIR/disk.sh"
  click_script="open -a \"Disk Utility\""
)

net_in=(
  # Styling
  width=dynamic
  icon="$NET_IN_ICON"
  icon.font="$SYSTEM_NET_IN_ICON_FONT"
  label="?"
  label.font="$SYSTEM_NET_IN_LABEL_FONT"

  # Padding
  icon.padding_left="$SYSTEM_ICON_PADDING_LEFT"
  icon.padding_right="$SYSTEM_ICON_PADDING_RIGHT"
  label.padding_left="$SYSTEM_LABEL_PADDING_LEFT"
  label.padding_right="$SYSTEM_LABEL_PADDING_RIGHT"

  # Script
  script="$PLUGIN_DIR/net_in.sh"
  click_script="open -a \"Activity Monitor\""
)

net_out=(
  # Styling
  width=dynamic
  icon="$NET_OUT_ICON"
  icon.font="$SYSTEM_NET_OUT_ICON_FONT"
  label="?"
  label.font="$SYSTEM_NET_OUT_LABEL_FONT"

  # Padding
  icon.padding_left="$SYSTEM_ICON_PADDING_LEFT"
  icon.padding_right="$SYSTEM_ICON_PADDING_RIGHT"
  label.padding_left="$SYSTEM_LABEL_PADDING_LEFT"
  label.padding_right="$SYSTEM_LABEL_PADDING_RIGHT"

  # Script
  script="$PLUGIN_DIR/net_out.sh"
  click_script="open -a \"Activity Monitor\""
)

ping=(
  # Styling
  width=dynamic
  icon="$PING_ICON"
  icon.font="$SYSTEM_PING_ICON_FONT"
  label="?"
  label.font="$SYSTEM_PING_LABEL_FONT"

  # Padding
  icon.padding_left="$SYSTEM_ICON_PADDING_LEFT"
  icon.padding_right="$SYSTEM_ICON_PADDING_RIGHT"
  label.padding_left="$SYSTEM_LABEL_PADDING_LEFT"
  label.padding_right="$SYSTEM_LABEL_PADDING_RIGHT"

  # Script
  script="$PLUGIN_DIR/ping.sh"
  click_script="open -a \"Activity Monitor\""
)

brew=(
  # Styling
  width=dynamic
  icon="$BREW_ICON"
  icon.font="$SYSTEM_BREW_ICON_FONT"
  label="?"
  label.font="$SYSTEM_BREW_LABEL_FONT"

  # Padding
  icon.padding_left="$SYSTEM_ICON_PADDING_LEFT"
  icon.padding_right="$SYSTEM_ICON_PADDING_RIGHT"
  label.padding_left="$SYSTEM_LABEL_PADDING_LEFT"
  label.padding_right="$SYSTEM_LABEL_PADDING_RIGHT"

  # Script
  script="$PLUGIN_DIR/brew.sh"
  click_script="brew update"
  update_freq=3600
)

system_cpu() {
  sketchybar --add item cpu "$1" \
             --set cpu "${cpu[@]}"
}

system_mem() {
  sketchybar --add item mem "$1" \
             --set mem "${mem[@]}"
}

system_disk() {
  sketchybar --add item disk "$1" \
             --set disk "${disk[@]}"
}

system_brew() {
  sketchybar --add event brew_update \
             --add item brew "$1"    \
             --set brew "${brew[@]}" \
             --subscribe brew brew_update mouse.clicked
}

system_ping() {
  sketchybar --add item ping "$1" \
             --set ping "${ping[@]}"
}

system_net_in() {
  sketchybar --add item net_in "$1" \
             --set net_in "${net_in[@]}"
}

system_net_out() {
  sketchybar --add item net_out "$1" \
             --set net_out "${net_out[@]}"
}
