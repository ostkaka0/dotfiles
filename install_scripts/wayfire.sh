yay -S xorg-xwayland
yay -S wayfire
yay -S alacrity
yay -S wofi
yay -S wf-shell
yay -S grim
yay -S wlogout


# download default wayfire.ini
#curl https://raw.githubusercontent.com/WayfireWM/wayfire/master/wayfire.ini .config/wayfire.ini

echo "Change /bin/firefox to following:"
echo "#!/bin/sh"
echo "export MOZ_ENABLE_WAYLAND=1"
echo 'exec /usr/bin/firefox-bin "$@"'