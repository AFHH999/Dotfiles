#!/bin/bash
# Resize active window by a pixel delta
# Usage: resize-helper.sh <left|right|up|down> <pixels>

eval "$(hyprctl activewindow -j | jq -r '"W=\(.size[0]); H=\(.size[1])"')"

case "$1" in
	left)  hyprctl dispatch "hl.dsp.window.resize({ x = $((W - ${2:-50})), y = $H })" >/dev/null 2>&1 ;;
	right) hyprctl dispatch "hl.dsp.window.resize({ x = $((W + ${2:-50})), y = $H })" >/dev/null 2>&1 ;;
	up)    hyprctl dispatch "hl.dsp.window.resize({ x = $W, y = $((H - ${2:-50})) })" >/dev/null 2>&1 ;;
	down)  hyprctl dispatch "hl.dsp.window.resize({ x = $W, y = $((H + ${2:-50})) })" >/dev/null 2>&1 ;;
esac
