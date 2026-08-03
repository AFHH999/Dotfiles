#!/bin/bash
# /* ---- 💫 Simplified Dropdown Terminal 💫 ---- */
# Usage: ./NDropDownTerm.sh <terminal_command>
# Example: ./NDropDownTerm.sh 'ghostty --title=dropdown-terminal'

SPECIAL_WS="special:scratchpad"
TERMINAL_CMD="$1"

# Dropdown size and position (percentages)
WIDTH_PERCENT=60
HEIGHT_PERCENT=60

# Validate input
if [ -z "$TERMINAL_CMD" ]; then
	echo "Usage: $0 <terminal_command>"
	echo "Example: $0 'ghostty --title=dropdown-terminal'"
	exit 1
fi

# Get current workspace
CURRENT_WS=$(hyprctl activeworkspace -j | jq -r '.id')

# Terminal detection functions
terminal_exists() {
	hyprctl clients -j | jq -e 'any(.[]; .title == "dropdown-terminal")' >/dev/null 2>&1
}

get_terminal_address() {
	hyprctl clients -j | jq -r '.[] | select(.title == "dropdown-terminal") | .address' | head -1
}

terminal_in_special() {
	hyprctl clients -j | jq -e 'any(.[]; .title == "dropdown-terminal" and .workspace.name == "special:scratchpad")' >/dev/null 2>&1
}

# Calculate dropdown size
calculate_dropdown_size() {
	monitor_info=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | "\(.x) \(.y) \(.width) \(.height) \(.reserved[0]) \(.reserved[1])"')
	mon_width=$(echo "$monitor_info" | cut -d' ' -f3)
	mon_height=$(echo "$monitor_info" | cut -d' ' -f4)
	reserved_top=$(echo "$monitor_info" | cut -d' ' -f5)
	reserved_bottom=$(echo "$monitor_info" | cut -d' ' -f6)

	available_height=$((mon_height - reserved_top - reserved_bottom))
	width=$((mon_width * WIDTH_PERCENT / 100))
	height=$((available_height * HEIGHT_PERCENT / 100))

	echo "$width $height"
}

# Lua dispatch helper
lua_dispatch() {
	hyprctl dispatch "$1" >/dev/null 2>&1
}

# Spawn new terminal
spawn_terminal() {
	read -r width height <<< "$(calculate_dropdown_size)"

	printf -v lua_cmd 'hl.dsp.exec_cmd("%s", { float = true, size = { %s, %s }, workspace = "special:scratchpad" })' "$TERMINAL_CMD" "$width" "$height"
	lua_dispatch "$lua_cmd"

	for i in {1..15}; do
		TERMINAL_ADDR=$(get_terminal_address)
		[ -n "$TERMINAL_ADDR" ] && break
		sleep 0.1
	done

	printf -v lua_cmd 'hl.dsp.window.move({ workspace = %s, address = "%s" })' "$CURRENT_WS" "$TERMINAL_ADDR"
	lua_dispatch "$lua_cmd"

	printf -v lua_cmd 'hl.dsp.window.pin({ address = "%s" })' "$TERMINAL_ADDR"
	lua_dispatch "$lua_cmd"

	printf -v focus_ref 'address:%s' "$TERMINAL_ADDR"
	printf -v lua_cmd 'hl.dsp.focus({ window = "%s" })' "$focus_ref"
	lua_dispatch "$lua_cmd"
}

# Main logic
if terminal_exists; then
	TERMINAL_ADDR=$(get_terminal_address)

	if terminal_in_special; then
		printf -v focus_ref 'address:%s' "$TERMINAL_ADDR"

		printf -v lua_cmd 'hl.dsp.focus({ window = "%s" })' "$focus_ref"
		lua_dispatch "$lua_cmd"
		sleep 0.1

		printf -v lua_cmd 'hl.dsp.window.move({ workspace = %s, address = "%s" })' "$CURRENT_WS" "$TERMINAL_ADDR"
		lua_dispatch "$lua_cmd"

		printf -v lua_cmd 'hl.dsp.window.pin({ address = "%s" })' "$TERMINAL_ADDR"
		lua_dispatch "$lua_cmd"

		printf -v lua_cmd 'hl.dsp.focus({ window = "%s" })' "$focus_ref"
		lua_dispatch "$lua_cmd"
	else
		printf -v lua_cmd 'hl.dsp.window.pin({ address = "%s" })' "$TERMINAL_ADDR"
		lua_dispatch "$lua_cmd"

		printf -v lua_cmd 'hl.dsp.window.move({ workspace = "special:scratchpad", address = "%s" })' "$TERMINAL_ADDR"
		lua_dispatch "$lua_cmd"
	fi
else
	spawn_terminal
fi
