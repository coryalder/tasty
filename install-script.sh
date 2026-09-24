#!/usr/bin/env bash
#
# Install script for the tasty Hyprland config.
#
# 1. Links the components repo into ~/.config/hypr/tasty-components in a way
#    that is robust enough to survive a git update.
#       If there is already a symlink, replace it with a new one.
# 2. Copies tasty-config.lua-init to ~/.config/hypr/tasty-config.lua
#       unless there is already a tasty-config.lua file there, in which case
#       it prompts if we want to overwrite (default: no).
#
#
# A separate script installs this all from a base fedora install.
set -euo pipefail

# Resolve the repo root from this script's location, so the install works
# no matter where the repo is checked out (and survives `git pull` / `git reset`,
# since we always derive the source path at install time).
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
COMPONENTS_SRC="$SCRIPT_DIR/src/tasty-components"
CONFIG_INIT="$SCRIPT_DIR/src/hyprland.lua-init"

DEST_DIR="$HOME/.config/hypr"
DEST_COMPONENTS="$DEST_DIR/tasty-components"
DEST_CONFIG="$DEST_DIR/hyprland.lua"

[ -d "$COMPONENTS_SRC" ] || { echo "error: $COMPONENTS_SRC not found" >&2; exit 1; }
[ -f "$CONFIG_INIT" ] || { echo "error: $CONFIG_INIT not found" >&2; exit 1; }

mkdir -p "$DEST_DIR"

# 1. Symlink the components directory. Replace any existing symlink.
if [ -L "$DEST_COMPONENTS" ]; then
    rm "$DEST_COMPONENTS"
elif [ -e "$DEST_COMPONENTS" ]; then
    echo "error: $DEST_COMPONENTS exists and is not a symlink; refusing to touch it" >&2
    exit 1
fi
ln -s "$COMPONENTS_SRC" "$DEST_COMPONENTS"
echo "linked $DEST_COMPONENTS -> $COMPONENTS_SRC"

# 2. Install tasty-config.lua, prompting before overwriting an existing one.
if [ -e "$DEST_CONFIG" ]; then
    read -r -p "$DEST_CONFIG already exists. Overwrite it? [y/N] " ans
    case "$ans" in
        [Yy]*) cp "$CONFIG_INIT" "$DEST_CONFIG"; echo "overwrote $DEST_CONFIG" ;;
        *)     echo "leaving existing $DEST_CONFIG in place" ;;
    esac
else
    cp "$CONFIG_INIT" "$DEST_CONFIG"
    echo "installed $DEST_CONFIG"
fi
