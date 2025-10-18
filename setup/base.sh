#!/usr/bin/env sh

# install packages
packages=(
    less                # used by man
    man
    git
    openssh
    vim
    base-devel
    nvidia-utils
    nvidia-dkms
    noto-fonts
    ttf-hack-nerd
    hyprland
    hyprpaper 
)

sudo pacman -Syu --noconfirm --needed "${packages[@]}"

# install yay
yayDir=yay_temp
git clone https://aur.archlinux.org/yay.git $yayDir
pushd $yayDir
makepkg -si
popd
rm -rf $yayDir
