#!/bin/bash
if [ "$(whoami)" != "root" ]; then
    echo "Error: Root access required."
    exit
fi

echo ""
lsblk -pa
echo ""
read -p "Grub device(/dev/sdX): " grub_device


if [[  ! -e "$grub_device" ]]; then
    echo "Error: File $grub_device doesn't exist."
    exit
fi

set -x

pacman -S grub os-prober --needed
grub-install $grub_device
./grub_update.sh