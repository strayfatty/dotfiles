#!/usr/bin/env bash
# focus-emacs.sh: focus the floating lazygit window if present,
# otherwise focus Emacs if running, or start it. (yabai/macOS)

# Focus the floating lazygit Alacritty window if it exists
lazygit_id=$(yabai -m query --windows \
  | jq -r '.[] | select(.app=="alacritty") | select(.title|test("^lazygit.floating$")) | .id' \
  | head -n1)

if [ -n "$lazygit_id" ]; then
  yabai -m window --focus "$lazygit_id"
  exit 0
fi

# Otherwise, focus Emacs if it is running
emacs_id=$(yabai -m query --windows \
  | jq -r '.[] | select(.app=="Emacs") | .id' \
  | head -n1)

if [ -n "$emacs_id" ]; then
  yabai -m window --focus "$emacs_id"
else
  open -a Emacs
fi
