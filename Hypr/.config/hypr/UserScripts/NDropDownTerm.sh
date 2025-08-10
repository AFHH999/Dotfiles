#!/bin/bash
# /* ---- 💫 Simplified Dropdown Terminal 💫 ---- */
# Usage: ./NDropDownTerm.sh <terminal_command>
# Example: ./NDropDownTerm.sh 'kitty -T dropdown-terminal -e zsh'

SPECIAL_WS="special:scratchpad"
TERMINAL_CMD="$1"

# Dropdown size and position (percentages)
WIDTH_PERCENT=60
HEIGHT_PERCENT=60
X_PERCENT=30
Y_PERCENT=30

# Validate input
if [ -z "$TERMINAL_CMD" ]; then
    echo "Usage: $0 <terminal_command>"
    echo "Example: $0 'kitty -T dropdown-terminal -e zsh'"
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

# Calculate dropdown position
calculate_dropdown_position() {
    monitor_info=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | "\(.x) \(.y) \(.width) \(.height) \(.reserved[0]) \(.reserved[1])"')
    mon_x=$(echo $monitor_info | cut -d' ' -f1)
    mon_y=$(echo $monitor_info | cut -d' ' -f2)
    mon_width=$(echo $monitor_info | cut -d' ' -f3)
    mon_height=$(echo $monitor_info | cut -d' ' -f4)
    reserved_top=$(echo $monitor_info | cut -d' ' -f5)
    reserved_bottom=$(echo $monitor_info | cut -d' ' -f6)

    available_height=$((mon_height - reserved_top - reserved_bottom))
    width=$((mon_width * WIDTH_PERCENT / 100))
    height=$((available_height * HEIGHT_PERCENT / 100))
    x=$((mon_x + (mon_width * X_PERCENT / 100)))
    y=$((mon_y + reserved_top + (available_height * Y_PERCENT / 100)))

    echo "$x $y $width $height"
}

# Spawn new terminal
spawn_terminal() {
    pos_info=$(calculate_dropdown_position)
    width=$(echo $pos_info | cut -d' ' -f3)
    height=$(echo $pos_info | cut -d' ' -f4)

    hyprctl dispatch exec "[float; size $width $height; workspace special:scratchpad silent; title dropdown-terminal] $TERMINAL_CMD"
    sleep 0.3 # Wait for terminal to spawn

    TERMINAL_ADDR=$(get_terminal_address)
    hyprctl dispatch movetoworkspacesilent "$CURRENT_WS,address:$TERMINAL_ADDR"
    hyprctl dispatch pin "address:$TERMINAL_ADDR"
    hyprctl dispatch focuswindow "address:$TERMINAL_ADDR"
}

# Main logic
if terminal_exists; then
    TERMINAL_ADDR=$(get_terminal_address)

    if terminal_in_special; then
        # Bring to current workspace
        pos_info=$(calculate_dropdown_position)
        width=$(echo $pos_info | cut -d' ' -f3)
        height=$(echo $pos_info | cut -d' ' -f4)

        hyprctl dispatch movetoworkspacesilent "$CURRENT_WS,address:$TERMINAL_ADDR"
        hyprctl dispatch pin "address:$TERMINAL_ADDR"
        hyprctl dispatch resizewindowpixel "exact $width $height,address:$TERMINAL_ADDR"
        hyprctl dispatch focuswindow "address:$TERMINAL_ADDR"
    else
        # Send to scratchpad
        hyprctl dispatch pin "address:$TERMINAL_ADDR"
        hyprctl dispatch movetoworkspacesilent "$SPECIAL_WS,address:$TERMINAL_ADDR"
    fi
else
    spawn_terminal
fi
