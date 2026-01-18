#!/usr/bin/env fish

cd (dirname (status --current-filename))
source pkg.fish

# KDE / Qt integration
install_pacman \
    kde-cli-tools \
    kio \
    kio-extras \
    qt5ct \
    qt6ct \
    xdg-desktop-portal-kde \
    polkit-kde-agent

# KDE applications
install_pacman \
    dolphin \
    dolphin-plugins \
    ark \
    konsole \
    okular \
    gwenview \
    kcalc
