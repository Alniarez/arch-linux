#!/usr/bin/env fish

# Ensure we are running from the script directory
cd (dirname (status --current-filename))

# Install yay if missing
if not type -q yay
    sudo pacman -S --needed git base-devel

    set tmpdir (mktemp -d)
    git clone https://aur.archlinux.org/yay.git $tmpdir/yay
    pushd $tmpdir/yay
    makepkg -si --noconfirm
    popd
    rm -rf $tmpdir
end

# Sync and upgrade system
sudo pacman -Syyu
