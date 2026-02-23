#!/usr/bin/env fish

cd (dirname (status --current-filename))
source pkg.fish

install_pacman \
    pipewire \
    pipewire-alsa \
    pipewire-pulse \
    wireplumber \
    qt5-wayland \
    qt6-wayland \
    polkit \
    xdg-desktop-portal-kde
