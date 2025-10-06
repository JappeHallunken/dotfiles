#!/bin/bash
# foot-cycle-themes.sh

# Define the themes and foot configuration path
THEMES=(
    "/usr/share/foot/themes/tempus-dawn"
    "/usr/share/foot/themes/tempus-future"
)
FOOT_CONFIG="$HOME/.config/foot/foot.ini"

# Get the current theme by reading the include line
CURRENT_THEME=$(grep '^include=' "$FOOT_CONFIG" | cut -d= -f2)

# Find the index of the current theme in the THEMES array
CURRENT_INDEX=-1
for i in "${!THEMES[@]}"; do
    if [[ "${THEMES[$i]}" == "$CURRENT_THEME" ]]; then
        CURRENT_INDEX=$i
        break
    fi
done

# Calculate the next theme index (wrap around using modulo)
NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#THEMES[@]} ))

# Update the theme in the foot.ini file without overwriting the whole file
sed -i "s|^include=.*|include=${THEMES[$NEXT_INDEX]}|" "$FOOT_CONFIG"

/usr/bin/notify-send "Theme Switched" "The theme has been successfully switched to: ${THEMES[$NEXT_INDEX]}"
