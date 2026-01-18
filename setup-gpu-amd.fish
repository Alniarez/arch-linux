#!/usr/bin/env fish

cd (dirname (status --current-filename))
source pkg.fish

install_pacman \
    mesa \
    lib32-mesa \
    vulkan-radeon \
    lib32-vulkan-radeon \
    libva-mesa-driver \
    lib32-libva-mesa-driver \
    vulkan-tools \
    libva-utils \
    vdpauinfo
