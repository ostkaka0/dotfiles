pacman -S --needed libvirt qemu virt-manager dnsmasq
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
virsh net-autostart default
virsh net-start default
