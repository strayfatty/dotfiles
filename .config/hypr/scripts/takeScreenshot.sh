#!/usr/bin/env bash

OUT_DIR="$HOME/screenshots"
if [[ ! -d "$OUT_DIR" ]]; then
    # notify user
    exit 1
fi

SELECTION=""

# TODO get active workspaces from all monitors
get_rectangles() {
  local active_workspace=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .activeWorkspace.id')
  hyprctl monitors -j | jq -r --arg ws "$active_workspace" '.[] | select(.activeWorkspace.id == ($ws | tonumber)) | "\(.x),\(.y) \((.width / .scale) | floor)x\((.height / .scale) | floor)"'
  hyprctl clients -j | jq -r --arg ws "$active_workspace" '.[] | select(.workspace.id == ($ws | tonumber)) | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"'
}

while [[ $# -gt 0 ]]; do
    case $1 in
        -r|--region)
            SELECTION=$(slurp 2>/dev/null)
            shift
            ;;
        -w|--window)
            SELECTION=$(get_rectangles | slurp -r 2>/dev/null)
            shift
            ;;
        -f|--fullscreen)
            SELECTION=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | "\(.x),\(.y) \((.width / .scale) | floor)x\((.height / .scale) | floor)"')
            shift
            ;;
        *)
            # notify user
            exit 1
            ;;
    esac
done

if [[ $SELECTION == "" ]]; then
    # notify user
    exit 1
fi

# echo $SELECTION

grim -g "$SELECTION" - |
    satty --filename - \
        --output-filename "$OUT_DIR/screenshot-$(date +'%Y-%m-%dT%H-%M-%S').png" \
        --early-exit \
        --actions-on-enter save-to-clipboard \
        --save-after-copy \
        --disable-notifications \
        --copy-command 'wl-copy'
