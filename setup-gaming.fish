#!/usr/bin/env fish

cd (dirname (status --current-filename))
source pkg.fish

# --------------------------------------------------
# Core gaming stack
# --------------------------------------------------
install_pacman \
    steam \
    wine \
    wine-mono \
    wine-gecko \
    winetricks \
    gamemode \
    lib32-gamemode \
    mangohud \
    lib32-mangohud

# --------------------------------------------------
# Vulkan userspace
# --------------------------------------------------
install_pacman \
    vulkan-icd-loader \
    lib32-vulkan-icd-loader \
    vulkan-tools

# --------------------------------------------------
# Wine / Battle.net runtime dependencies (Lutris)
# --------------------------------------------------
install_pacman \
    lib32-libpulse \
    lib32-alsa-plugins \
    lib32-openal \
    giflib \
    lib32-giflib \
    libpng \
    lib32-libpng \
    gnutls \
    lib32-gnutls \
    lib32-mpg123

# --------------------------------------------------
# Controllers / input
# --------------------------------------------------
install_pacman \
    game-devices-udev \
    steam-devices

# --------------------------------------------------
# Gaming utilities
# --------------------------------------------------
install_pacman \
    vkbasalt \
    lib32-vkbasalt \
    libva-utils \
    vdpauinfo

# --------------------------------------------------
# Non-Steam launcher
# --------------------------------------------------
install_yay \
    lutris

# --------------------------------------------------
# GPU selection
# --------------------------------------------------
echo
echo "Select GPU setup:"
echo "  1) AMD"
echo "  2) NVIDIA*"
echo "  3) NVIDIA (DKMS)*"
echo "  4) Intel*"
echo "  5) Hybrid (Intel + NVIDIA)*"
echo "  6) Skip"
echo
echo "Note:"
echo "- Desktop AMD -> choose AMD"
echo "- Desktop Intel -> choose Intel"
echo "- Laptop with Intel + NVIDIA -> Hybrid"
echo
echo "!!!! Scripts marked with * are untested by me"
echo "!!!! I only have an AMD GPU. Use at your own risk :)"

read -P "Choice [1-6]: " gpu_choice

switch $gpu_choice
    case 1
        fish setup-gpu-amd.fish
    case 2
        fish setup-gpu-nvidia.fish
    case 3
        fish setup-gpu-nvidia-dkms.fish
    case 4
        fish setup-gpu-intel.fish
    case 5
        fish setup-gpu-hybrid.fish
    case 6
        echo "Skipping GPU setup"
    case '*'
        echo "Invalid choice, skipping GPU setup"
end
