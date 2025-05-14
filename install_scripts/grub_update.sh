#!/bin/bash
if [ "$(whoami)" != "root" ]; then
    echo "Error: Root access required."
    exit
fi

set -x

pacman -S grub-theme-vimix ttf-dejavu --needed
sudo grub-mkfont -s 24 -o /boot/grub/fonts/dejavu24 /usr/share/fonts/misc/ttf-dejavu.ttf
cp ./etc_default_grub /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg