#!/usr/bin/env bash

# Focus the floating lazygit Alacritty window if it exists.
lazygit_address=$(hyprctl -j clients \
  | jq -r '.[] | select(.class == "Alacritty")
    | select(.initialTitle == "lazygit-floating")
    | .address' \
  | head -n1)

if [[ -n "$lazygit_address" ]]; then
  hyprctl dispatch focuswindow "address:$lazygit_address"
  exit 0
fi

# Otherwise, focus Emacs if it is running.
emacs_address=$(hyprctl -j clients \
  | jq -r '.[] | select(.class == "Emacs" or .initialClass == "Emacs") | .address' \
  | head -n1)

if [[ -n "$emacs_address" ]]; then
  hyprctl dispatch focuswindow "address:$emacs_address"
else
  hyprctl dispatch exec emacs
fi
