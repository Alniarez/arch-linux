#!/bin/sh
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

sudo pacman -Syu --needed fish git base-devel

exec fish "$SCRIPT_DIR/install.fish"
