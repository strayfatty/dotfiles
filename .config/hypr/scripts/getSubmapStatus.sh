#!/usr/bin/env bash

set -euo pipefail

submap="$(hyprctl submap 2>/dev/null | tr -d '\n' || true)"

if [[ "$submap" == "clean" ]]; then
    printf '{"text":"KEYS OFF","class":"active","tooltip":"Temporary keybinding mode: %s"}\n' "$submap"
    exit 0
fi

printf '{"text":"","class":"hidden","tooltip":"Default keybinding mode"}\n'
