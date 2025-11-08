#!/usr/bin/env bash

POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
    case $1 in
        -T|--initialTitle)
            TITLE="$2"
            CLIENT_REF="initialTitle:$2"
            shift
            shift
            ;;
        *)
            POSITIONAL_ARGS+=("$1")
            shift
            ;;
    esac
done

APPLICATION=${POSITIONAL_ARGS[0]}

if [[ $TITLE == "" ]]; then
   echo "no title specified"
   exit 1
fi

if [[ $APPLICATION == "" ]]; then
   echo "no application specified"
   exit 1
fi

# echo "title: $TITLE"
# echo "app: $APPLICATION"

pid=$(hyprctl -j clients | jq -r "[.[] | select((.initialTitle == \"${TITLE}\") and (.class == \"Alacritty\")) | .pid] | first")
# echo "pid: ${pid}"

if [[ ($pid != "") && ($pid != "null") ]]
then
    hyprctl dispatch focuswindow "pid:$pid"
else
    hyprctl dispatch -- exec alacritty -T "$TITLE" -e "${APPLICATION}"
fi
