 #!/bin/bash
set -x
pacman -S --needed \
xf86-video-vesa \
xorg \
lightdm \
lightdm-gtk-greeter \
lightdm-gtk-greeter-settings \
gnome gnome-extra \
xorg-xinput

systemctl enable lightdm