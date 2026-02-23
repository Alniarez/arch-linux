#!/usr/bin/env fish

cd (dirname (status --current-filename))
source pkg.fish

# Java
install_yay \
    jdk-temurin

install_pacman \
    gradle

# C / C++
install_pacman \
    base-devel \
    cmake \
    pkgconf \
    clang \
    lldb \
    gdb \
    valgrind \
    perf


# Rust
install_pacman \
    rustup

# JS
install_pacman \
    nodejs \
    npm

# Python
install_pacman \
    python

# Go
install_pacman \
    go

# Ruby
install_pacman \
    rbenv \
    ruby-build
