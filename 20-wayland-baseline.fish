#!/usr/bin/env fish

cd (dirname (status --current-filename))
source pkg.fish

install_pacman \
    pipewire \
    pipewire-alsa \
    pipewire-pulse \
    wireplumber \
    xdg-desktop-portal \
    xdg-desktop-portal-gtk \
    qt5-wayland \
    qt6-wayland \
    polkit \
    wl-clipboard \
    grim \
    slurp \
    swappy

# Compositor-specific portal
if type -q Hyprland
    install_pacman xdg-desktop-portal-hyprland
end
