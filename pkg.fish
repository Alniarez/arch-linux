#!/usr/bin/env fish

function install_pacman
    if test (count $argv) -eq 0
        echo "install_pacman: no packages specified"
        return 1
    end

    sudo pacman -S --needed $argv
end

function install_yay
    if test (count $argv) -eq 0
        echo "install_yay: no packages specified"
        return 1
    end

    if not type -q yay
        echo "install_yay: yay is not installed. Run 00-bootstrap.fish first."
        return 1
    end

    for pkg in $argv
        if yay -Q $pkg >/dev/null 2>&1
            continue
        end
        yay -S --noconfirm $pkg
    end
end

function enable_service
    if test (count $argv) -eq 0
        echo "enable_service: no services specified"
        return 1
    end

    for svc in $argv
        if systemctl is-enabled $svc >/dev/null 2>&1
            continue
        end
        sudo systemctl enable --now $svc
    end
end
