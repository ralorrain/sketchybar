#!/usr/bin/env bash

source "$CONFIG_DIR/theme.sh"

net_in_valuefile="/tmp/net_in.dat"

get_values() {
  if [ ! -f "$net_in_valuefile" ]; then
      prev_net_in=0
  else
      prev_net_in=$(cat "$net_in_valuefile")
  fi

  new_net_in=$(netstat -bi | grep 'Link#' | awk '{ x += $7 } END { print x }')
  echo "${new_net_in}" > "$net_in_valuefile"
  net_in_diff=$((new_net_in - prev_net_in))
  NET_IN=$(set_unit "$((net_in_diff / UPDATE_FREQ))")
}

set_unit() {
  if [ "$1" -lt 1024 ]; then
    echo "${1}b"
  elif [ "$1" -lt 1048576 ]; then
    echo "$(( $1 / 1024 ))kb"
  elif [ "$1" -lt 1073741824 ]; then
    echo "$(( $1 / 1048576 ))mb"
  else
    echo "$(( $1 / 1073741824 ))gb"
  fi
}

UPDATE_FREQ=5
ICON_COLOR=$SYSTEM_NET_IN_NORMAL_ICON_COLOR
LABEL_COLOR=$SYSTEM_NET_IN_NORMAL_LABEL_COLOR
BACKGROUND_COLOR=$SYSTEM_NET_IN_NORMAL_BACKGROUND_COLOR
BACKGROUND_BORDER_COLOR=$SYSTEM_NET_IN_NORMAL_BACKGROUND_BORDER_COLOR

get_values

if [[ $NET_IN =~ [1-9][0-9][0-9]kb ]]; then
  ICON_COLOR=$SYSTEM_NET_IN_WARNING_ICON_COLOR
  LABEL_COLOR=$SYSTEM_NET_IN_WARNING_LABEL_COLOR
  BACKGROUND_COLOR=$SYSTEM_NET_IN_WARNING_BACKGROUND_COLOR
  BACKGROUND_BORDER_COLOR=$SYSTEM_NET_IN_WARNING_BACKGROUND_BORDER_COLOR
elif [[ $NET_IN =~ mb ]]; then
  ICON_COLOR=$SYSTEM_NET_IN_CRITICAL_ICON_COLOR
  LABEL_COLOR=$SYSTEM_NET_IN_CRITICAL_LABEL_COLOR
  BACKGROUND_COLOR=$SYSTEM_NET_IN_CRITICAL_BACKGROUND_COLOR
  BACKGROUND_BORDER_COLOR=$SYSTEM_NET_IN_CRITICAL_BACKGROUND_BORDER_COLOR
elif [[ $NET_IN =~ gb ]]; then
  ICON_COLOR=$SYSTEM_NET_IN_CRITICAL_ICON_COLOR
  LABEL_COLOR=$SYSTEM_NET_IN_CRITICAL_LABEL_COLOR
  BACKGROUND_COLOR=$SYSTEM_NET_IN_CRITICAL_BACKGROUND_COLOR
  BACKGROUND_BORDER_COLOR=$SYSTEM_NET_IN_CRITICAL_BACKGROUND_BORDER_COLOR
fi

sketchybar --set "$NAME" label="$NET_IN"              \
                 update_freq="$UPDATE_FREQ"           \
                 icon.color="$ICON_COLOR"             \
                 label.color="$LABEL_COLOR"           \
                 background.color="$BACKGROUND_COLOR" \
                 background.border_color="$BACKGROUND_BORDER_COLOR"
