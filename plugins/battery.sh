#!/usr/bin/env bash

source "$CONFIG_DIR/theme.sh"

BATTERY_INFO="$(pmset -g batt)"
PERCENTAGE=$(echo "$BATTERY_INFO" | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(echo "$BATTERY_INFO" | grep 'AC Power')

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

DRAWING=on
case ${PERCENTAGE} in
  9[0-9]|100) ICON=$BATTERY_100
  ;;
  [6-8][0-9]) ICON=$BATTERY_75
  ;;
  [4-5][0-9]) ICON=$BATTERY_50
  ;;
  [1-3][0-9]) ICON=$BATTERY_25
  ;;
  [0-9])      ICON=$BATTERY_0
esac

case ${PERCENTAGE} in
  9[0-9]|100) COLOR=$BATTERY_FULL_COLOR
  ;;
  [3-8][0-9]) COLOR=$BATTERY_USED_COLOR
  ;;
  2[0-9])     COLOR=$BATTERY_WARNING_COLOR
  ;;
  [1][0-9])   COLOR=$BATTERY_CRITICAL_COLOR
  ;;
  [0-9])      COLOR=$BATTERY_CRITICAL_COLOR
esac

if [[ $CHARGING != "" ]]; then
  ICON=$BATTERY_CHARGING
  DRAWING=off
fi

sketchybar --set "$NAME" drawing=$DRAWING icon="$ICON" icon.color="$COLOR"
