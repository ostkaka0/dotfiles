 #!/bin/bash
set -x
pacman -S --needed \
xf86-video-vesa \
xorg \
lightdm \
lightdm-gtk-greeter \
lightdm-gtk-greeter-settings \
xfce4 xfce4-goodies \
xorg-xinput

systemctl enable lightdm