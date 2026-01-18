#!/usr/bin/env fish

cd (dirname (status --current-filename))
source pkg.fish

# Core dev essentials
install_pacman \
    git \
    github-cli \
    base-devel \
    cmake \
    pkgconf \
    clang \
    lldb \
    gdb \
    valgrind \
    perf \
    python \
    nodejs \
    npm \
    rust \
    ruby \
    gradle \
    emacs-wayland

# Java (Temurin)
install_yay \
    jdk-temurin \
    jetbrains-toolbox
