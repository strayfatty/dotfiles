#!/usr/bin/env bash

pid=$(hyprctl -j clients | jq -r "[.[] | select(.class | startswith(\"steam_app_\")) | .pid] | first")
echo "pid: ${pid}"

if [[ ($pid != "") && ($pid != "null") ]]
then
    hyprctl dispatch focuswindow "pid:$pid"
fi
