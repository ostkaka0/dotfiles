  #!/bin/bash
set -x

cd ~/
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
