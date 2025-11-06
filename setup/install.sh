#!/usr/bin/env bash

# install base
# ./base.sh

# install packages
packages=(
    lazygit
    git-delta       # diff tool and pager for lazygit
    emacs
    ripgrep
    fd
    jq
    bat
    htop
    alacritty
    stow
    pavucontrol     # audio control
    waybar
    keepassxc
    pnpm
)

sudo pacman -Syu --noconfirm --needed "${packages[@]}"

# install aur packages
aurPackages=(
    helium-browser-bin
    google-chrome
    goxlr-utility
    oh-my-posh-bin
)
yay -Syu --noconfirm --needed "${aurPackages[@]}"

# dark theme for gtk applications (pavucontrol)
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark

if [ ! -d ~/projects/strayfatty/chrome_extensions ]; then
# fetch extension for helium-browser
    mkdir -p ~/projects/strayfatty
    git clone http://chanko.de:3000/tulka/chrome_extensions.git ~/projects/strayfatty/chrome_extensions
fi
