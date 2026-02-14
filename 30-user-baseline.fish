#!/usr/bin/env fish

cd (dirname (status --current-filename))
source pkg.fish

# Fonts
install_pacman \
    noto-fonts \
    noto-fonts-cjk \
    noto-fonts-emoji \
    noto-fonts-extra \
    ttf-fira-code \
    ttf-fira-sans \
    ttf-fira-mono

# Browsers and mail
install_pacman \
    thunderbird \
    vivaldi \
    vivaldi-ffmpeg-codecs

# Desktop utilities
install_pacman \
    flatpak \
    flatpak-kcm \
    darktable \
    gimp \
    libopenraw \
    emacs-wayland

# AUR-only user apps
install_yay \
    zen-browser-bin \
    obsidian \
    proton-pass-bin \
    protonmail-bridge \
    proton-vpn-gtk-app

# Ensure Zen (Firefox-based) uses Wayland
set -Ux MOZ_ENABLE_WAYLAND 1
