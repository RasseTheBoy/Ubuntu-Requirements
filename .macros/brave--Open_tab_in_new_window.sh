#!/bin/bash


function press_key {
    xdotool key $1
    sleep 0.1
}


# Check if Brave browser is selected
if ! xdotool getactivewindow getwindowname | grep -q "Brave"; then
    echo -e 'Brave is not selected\a'
    notify-send "Error" "Brave is not selected"
    exit 1
fi


sleep 1

# Simulate Ctrl+L (select the URL bar)
press_key ctrl+l

# Simulate Ctrl+C (copy the URL)
press_key ctrl+c

# Simulate Ctrl+W (close the current tab)
press_key ctrl+w

# Simulate Ctrl+N (open a new window)
press_key ctrl+n

# Wait for the new window to open
sleep 0.5

# Simulate Ctrl+L (select the URL bar in the new window)
press_key ctrl+l

# Simulate Ctrl+V (paste the URL)
press_key ctrl+v

# # Simulate Enter (open the URL)
press_key Return
