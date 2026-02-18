#!/usr/bin/env bash

# install base
# ./base.sh

# install packages
packages=(
    cmake           # A cross-platform open-source make system
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
    wiremix         # A simple TUI audio mixer for PipeWire
    waybar          # Highly customizable Wayland bar for Sway and Wlroots based compositors
    keepassxc       # Cross-platform community-driven port of Keepass password manager
    flatpak         # Linux application sandboxing and distribution framework (formerly xdg-app)

    # screenshot tools
    wl-clipboard    # Command-line copy/paste utilities for Wayland
    slurp           # Select a region in a Wayland compositor
    grim            # Screenshot utility for Wayland
    satty           # Modern screenshot annotation tool, inspired by Swappy and Flameshot

    # music
    mpd             # Flexible, powerful, server-side application for playing music
    rmpc            # A beautiful and configurable TUI client for MPD

    # video
    mpv             # a free, open source, and cross-platform media player
    libdvdcss       # Portable abstraction library for DVD decryption
    losslesscut-bin # Crossplatform GUI tool for lossless trimming/cutting of video/audio files

    # syncthing
    syncthing       # Open Source Continuous Replication / Cluster Synchronization Thing

    # rust
    rustup          # The Rust toolchain installer
    rust-analyzer   # Rust compiler front-end for IDEs
)

sudo pacman -Syu --noconfirm --needed "${packages[@]}"

# install aur packages
aurPackages=(
    helium-browser-bin  # Private, fast, and honest web browser based on Chromium
    google-chrome       # The popular web browser by Google (Stable Channel)
    goxlr-utility       # A utility for monitoring and controlling a TC-Helicon GoXLR or GoXLR Mini.
    oh-my-posh-bin      # A prompt theme engine for any shell.
    legcord             # Discord client with builtin client mod and theme support
)
yay -Syu --noconfirm --needed "${aurPackages[@]}"

if [ ! -d ~/projects/chrome_extensions ]; then
# fetch extension for helium-browser
    mkdir -p ~/projects
    git clone https://github.com/strayfatty/chrome_extensions.git ~/projects/chrome_extensions
fi
