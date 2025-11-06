#!/usr/bin/env bash

# install packages
packages=(
    man-db              # A utility for reading man pages
    man-pages           # Linux man pages
    procps-ng           # Utilities for monitoring your system and its processes
    git                 # the fast distributed version control system
    openssh             # SSH protocol implementation for remote login, command execution and file transfer
    vim                 # Vi Improved, a highly configurable, improved version of the vi text editor
    base-devel          # Basic tools to build Arch Linux packages
    linux-headers       # Headers and scripts for building modules for the Linux kernel
    nvidia-utils        # NVIDIA drivers utilities
    nvidia-dkms         # NVIDIA kernel modules - module sources
    #nvidia-open-dkms    # NVIDIA open kernel modules - module sources
    noto-fonts          # Google Noto TTF fonts
    noto-fonts-cjk      # Google Noto CJK fonts
    noto-fonts-emoji    # Google Noto CJK fonts
    ttf-hack-nerd       # Patched font Hack from nerd fonts library
    hyprland            # a highly customizable dynamic tiling Wayland compositor
    hyprpaper           # a blazing fast wayland wallpaper utility with IPC controls
)

sudo pacman -Syu --noconfirm --needed "${packages[@]}"

# install yay
if ! command -v yay > /dev/null 2>&1; then
    yayDir=yay_temp
    git clone https://aur.archlinux.org/yay.git $yayDir
    pushd $yayDir
    makepkg -si
    popd
    rm -rf $yayDir
fi
