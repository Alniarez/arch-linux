#!/usr/bin/env fish

cd (dirname (status --current-filename))
source pkg.fish

install_pacman \
    nvidia-dkms \
    nvidia-utils \
    lib32-nvidia-utils \
    nvidia-settings \
    vulkan-icd-loader \
    lib32-vulkan-icd-loader \
    vulkan-tools
