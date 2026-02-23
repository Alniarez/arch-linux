#!/bin/sh
set -e

command -v fish >/dev/null 2>&1 || {
    echo "fish is required but not installed."
    exit 1
}

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

sudo pacman -Syu --needed fish git base-devel


exec fish "$SCRIPT_DIR/install.fish"

