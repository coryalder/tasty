# tasty

A small & opinionated **Hyprland configuration** — a ready-to-eat wayland desktop that gets you from "fresh install" to "feels right" quick.

Rather than opinions you are stuck with, tasty is split into bite-sized Lua components so you can pick, choose, fork, or spoon them. Each file is short, commented, and easy to read.

## Features

### Copy & Paste anywhere

Use `SUPER+C` and `SUPER+V` to copy and paste *everywhere*, including the terminal, with a little notification for visual feedback.

## How it works

1. checkout the repo onto your system, somewhere it can linger. Recommended: `.local/share/tasty`
2. run the install script `install.sh`
    - this symlinks `src/tasty-components` to `~/.config/hypr/tasty-components`
    - and copies the initial configuration from `src/hyprland.lua-init` to `~/.config/hypr/hyprland.lua`.
3. Your personal customizations go in `~/.config/hypr/hyprland.lua`, which the install script never clobbers.
