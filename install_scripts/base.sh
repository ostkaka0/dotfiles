#!/bin/bash
set -x
pacman -Syu

pacman -S --needed \
git \
base-devel \
gcc clang gdb \
python python2 \
zig \
assimp sdl sdl2 \
glfw-x11 \
strace

pacman -S --needed \
ranger \
htop \
rsync \
wget \
nano \
vim \
bash-completion



