#!/usr/bin/env bash

theme_valuefile="/tmp/sketchy_theme.dat"

if [ ! -f "$theme_valuefile" ]; then
  THEME="themes/catppuccin"
else
  THEME=$(cat "$theme_valuefile")
fi

theme
source "$CONFIG_DIR/$THEME/colors.sh"
source "$CONFIG_DIR/$THEME/fonts.sh"
source "$CONFIG_DIR/$THEME/icons.sh"
