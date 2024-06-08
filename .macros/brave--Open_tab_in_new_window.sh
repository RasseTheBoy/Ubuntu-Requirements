#!/bin/bash

function press_keys {
    xdotool key $1
    sleep 0.1
}

sleep 1

# Simulate Ctrl+L (select the URL bar)
press_keys ctrl+l

# Simulate Ctrl+C (copy the URL)
press_keys ctrl+c

# Simulate Ctrl+W (close the current tab)
press_keys ctrl+w

# Simulate Ctrl+N (open a new window)
press_keys ctrl+n

# Wait for the new window to open
sleep 0.5

# Simulate Ctrl+L (select the URL bar in the new window)
press_keys ctrl+l

# Simulate Ctrl+V (paste the URL)
press_keys ctrl+v

# # Simulate Enter (open the URL)
press_keys Return
