#!/usr/bin/env sh

className=$1
appName=$2

pid=$(hyprctl -j clients | jq -r ".[] | select(.class == \"${className}\") | .pid")

if [[ $pid != "" ]]
then
    hyprctl dispatch focuswindow pid:$pid
else
    hyprctl dispatch exec $appName
fi
