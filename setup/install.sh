#!/usr/bin/env bash

# install base
# ./base.sh

# install packages
packages=(
    lazygit         # Simple terminal UI for git commands
    git-delta       # Syntax-highlighting pager for git and diff output
    emacs           # The extensible, customizable, self-documenting real-time display editor
    ripgrep         # A search tool that combines the usability of ag with the raw speed of grep
    fd              # Simple, fast and user-friendly alternative to find
    jq              # Command-line JSON processor
    bat             # Cat clone with syntax highlighting and git integration
    htop            # Interactive process viewer
    alacritty       # A cross-platform, GPU-accelerated terminal emulator
    stow            # Manage installation of multiple softwares in the same directory tree
    pavucontrol     # PulseAudio Volume Control
    waybar          # Highly customizable Wayland bar for Sway and Wlroots based compositors
    keepassxc       # Cross-platform community-driven port of Keepass password manager
    pnpm            # Fast, disk space efficient package manager
)

sudo pacman -Syu --noconfirm --needed "${packages[@]}"

# install aur packages
aurPackages=(
    helium-browser-bin  # Private, fast, and honest web browser based on Chromium
    google-chrome       # The popular web browser by Google (Stable Channel)
    goxlr-utility       # A utility for monitoring and controlling a TC-Helicon GoXLR or GoXLR Mini.
    oh-my-posh-bin      # A prompt theme engine for any shell.
)
yay -Syu --noconfirm --needed "${aurPackages[@]}"

# dark theme for gtk applications (pavucontrol)
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark

if [ ! -d ~/projects/chrome_extensions ]; then
# fetch extension for helium-browser
    mkdir -p ~/projects
    git clone https://github.com/strayfatty/chrome_extensions.git ~/projects/chrome_extensions
fi
