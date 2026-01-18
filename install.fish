#!/usr/bin/env fish

set SCRIPT_DIR (dirname (status --current-filename))
cd $SCRIPT_DIR

echo "==> Starting Arch bootstrap"
echo

function run_step
    set name $argv[1]
    set file $argv[2]

    echo "==> $name"
    fish $file
    or begin
        echo "!! Failed at step: $name"
        exit 1
    end
    echo
end

run_step "Bootstrap (yay, system update)" 00-bootstrap.fish
run_step "System baseline" 10-system-baseline.fish
run_step "Wayland baseline" 20-wayland-baseline.fish
run_step "User baseline" 30-user-baseline.fish

read -P "Setup GitHub SSH? (y/N): " answer
if string match -qi y $answer
    run_step "GitHub SSH setup" setup-github-ssh.fish
end

read -P "Install KDE apps? (y/N): " answer
if string match -qi y $answer
    run_step "KDE applications" setup-kde.fish
end

read -P "Install development tools? (y/N): " answer
if string match -qi y $answer
    run_step "Development tools" setup-dev.fish
end

read -P "Setup gaming? (y/N): " answer
if string match -qi y $answer
    run_step "Gaming setup" setup-gaming.fish
end

echo "==> Install complete"
