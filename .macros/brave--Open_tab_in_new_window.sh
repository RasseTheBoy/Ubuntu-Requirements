#!/bin/bash
# Creator: Rasmus Ohert

function press_key {
    xdotool key $1
    sleep 0.1
}

# Stop the script if Brave is not the active window
if ! xdotool getactivewindow getwindowname | grep -q "Brave"; then
    echo -e 'Brave is not selected\a'
    notify-send "Error" "Brave is not selected"
    exit 1
fi

sleep 1             # A safety delay to ensure the user has enough time to release the macro activation keys

press_key ctrl+l    # Select the URL bar
press_key ctrl+c    # Copy the URL
press_key ctrl+w    # Close the current tab
press_key ctrl+n    # Open a new window
sleep 0.5           # Increase this value if the new window takes longer to open
press_key ctrl+l    # Select the URL bar
press_key ctrl+v    # Paste the URL
press_key Return    # Open the URL
