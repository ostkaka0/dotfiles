 #!/bin/bash
set -x
pacman -S --needed \
gdm \
thunar \
gnome-terminal \
gnome-tweaks \
gnome-control-center \
gnome-shell-extensions \
gvfs \
eog

systemctl enable gdm

sudo -u $SUDO_USER yay -S gnome-shell-extension-dash-to-panel
sudo -u $SUDO_USER yay -S gnome-shell-extension-arc-menu
