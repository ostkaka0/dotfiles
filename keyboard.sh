#!/bin/bash
setxkbmap se -option caps:swapescape -option compose:menu -variant nodeadkeys
xset r rate 150 100

# glove80
GLOVE80_ID=$(xinput list | grep "Glove80 Keyboard" | awk '{print $4}' | grep -o '[0-9]*')
setxkbmap se dvorak -device $GLOVE80_ID
