#!/usr/bin/env fish

cd (dirname (status --current-filename))
source pkg.fish

install_pacman \
    fish \
    stow \
    git \
    base-devel \
    networkmanager \
    power-profiles-daemon \
    dosfstools \
    nfs-utils \
    unrar

enable_service \
    NetworkManager \
    power-profiles-daemon

# Set fish as default shell
set fish_path (which fish)
if test "$SHELL" != "$fish_path"
    sudo chsh -s $fish_path (whoami)
end

echo
read -P "Remap Caps Lock to Control system-wide? (y/N): " answer

if string match -qi y $answer
    echo "Setting Caps Lock -> Control (ctrl:nocaps)"
    sudo localectl set-x11-keymap us pc105 "" ctrl:nocaps
end
