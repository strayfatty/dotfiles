#!/usr/bin/env sh

# install base
# ./base.sh

# install packages
packages=(
    lazygit
    git-delta
    emacs
    jq
    bat
)

sudo pacman -Syu --noconfirm --needed "${packages[@]}"

# install aur packages
aurPackages=(
    helium-browser-bin
)
yay -Syu --noconfirm --needed "${aurPackages[@]}"
