#!/usr/bin/env fish

cd (dirname (status --current-filename))
source pkg.fish

install_pacman \
    mesa \
    lib32-mesa \
    vulkan-intel \
    lib32-vulkan-intel \
    intel-media-driver \
    libva-utils \
    vulkan-tools
