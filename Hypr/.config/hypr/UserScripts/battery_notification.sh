#!/bin/sh

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

WARNING_LEVEL=15

# Loop over each acpi line until we find a valid battery
while read -r line; do
    PERCENT=$(echo "$line" | grep -Po '[0-9]+(?=%)')
    if [ "$PERCENT" -gt 0 ]; then
        BATTERY_STATUS="$line"
        BATTERY_LEVEL="$PERCENT"
        BATTERY_DISCHARGING=$(echo "$line" | grep -c "Discharging")
        break
    fi
done < <(acpi -b)

# If nothing valid was found
if [ -z "$BATTERY_LEVEL" ]; then
    echo "No valid battery level detected."
    exit 1
fi

# Notification state files
EMPTY_FILE=/tmp/batteryempty
FULL_FILE=/tmp/batteryfull
CHARGING_FILE=/tmp/batterycharging

# Reset state when charging state changes
if [ "$BATTERY_DISCHARGING" -eq 1 ]; then
    [ -f "$FULL_FILE" ] && rm "$FULL_FILE"
    [ -f "$CHARGING_FILE" ] && rm "$CHARGING_FILE"
elif [ "$BATTERY_DISCHARGING" -eq 0 ]; then
    [ -f "$EMPTY_FILE" ] && rm "$EMPTY_FILE"
fi

# 🔋 Fully charged
if [ "$BATTERY_LEVEL" -gt 95 ] && [ "$BATTERY_DISCHARGING" -eq 0 ] && [ ! -f "$FULL_FILE" ]; then
    notify-send "🔋 Battery Charged" "Battery is fully charged." -i "battery" -r 9991
    touch "$FULL_FILE"

# 🪫 Low battery
elif [ "$BATTERY_LEVEL" -le "$WARNING_LEVEL" ] && [ "$BATTERY_DISCHARGING" -eq 1 ] && [ ! -f "$EMPTY_FILE" ]; then
    notify-send "🪫 Low Battery" "${BATTERY_LEVEL}% remaining." -u critical -i "battery-alert"
    touch "$EMPTY_FILE"

# ⚡ Charging started
elif [ "$BATTERY_DISCHARGING" -eq 0 ] && [ ! -f "$CHARGING_FILE" ]; then
    notify-send "⚡ Charging" "Battery is now charging." -i "battery-good" -r 9992
    touch "$CHARGING_FILE"
fi
