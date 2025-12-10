# if [ ! "$DBUS_SESSION_BUS_ADDRESS" ]; then
#     eval "$(dbus-launch --sh-syntax --exit-with-x11)"
# fi


# xset r rate 150 100
# setxkbmap se -option caps:swapescape -option compose:menu -variant nodeadkeys -device 14
setxkbmap se dvorak -device 22
setxkbmap se -option caps:swapescape -option compose:menu -variant nodeadkeys
#pipewire &
#pipewire-pulse &
#sleep 0.5 &
#wireplumber &
#exec startxfce4
/home/ost/keyboard.sh
/home/ost/scripts/pipewire.sh &
    openbox-session
#i3
#openbox-session
#awesome
#openbox-session
#/home/ost/scripts/pipewire.sh
