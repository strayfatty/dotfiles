#!/usr/bin/env bash

BROWSER=helium-browser
POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
    case $1 in
        -t|--title)
            FILTER=".title == \"$2\""
            CLIENT_REF="title:$2"
            shift
            shift
            ;;
        -c|--class)
            FILTER=".class == \"$2\""
            CLIENT_REF="class:$2"
            shift
            shift
            ;;
        --chrome)
            BROWSER=google-chrome-stable
            shift
            ;;
        *)
            POSITIONAL_ARGS+=("$1")
            shift
            ;;
    esac
done

APPLICATION=${POSITIONAL_ARGS[0]}

if [[ $FILTER == "" ]]; then
   echo "no filter specified"
   exit
fi

if [[ $APPLICATION == "" ]]; then
   echo "no application specified"
   exit
fi

# echo "filter: $TITLE"
# echo "app: $APPLICATION"

pid=$(hyprctl -j clients | jq -r ".[] | select(${FILTER}) | .pid")
# echo "pid: ${pid}"

if [[ $pid != "" ]]
then
    hyprctl dispatch focuswindow $CLIENT_REF
else
    hyprctl dispatch -- exec $BROWSER --app="${APPLICATION}"
fi
