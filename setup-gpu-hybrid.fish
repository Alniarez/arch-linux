#!/usr/bin/env fish

cd (dirname (status --current-filename))
source pkg.fish

# Intel stack
install_pacman \
    mesa \
    vulkan-intel \
    lib32-vulkan-intel \
    intel-media-driver

# NVIDIA stack
install_pacman \
    nvidia \
    nvidia-utils \
    lib32-nvidia-utils \
    nvidia-settings

# Vulkan loader
install_pacman \
    vulkan-icd-loader \
    lib32-vulkan-icd-loader \
    vulkan-tools
