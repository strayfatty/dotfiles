#!/usr/bin/env bash

FILTER_ARGS=()
POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
    case $1 in
        -c|--class)
            FILTER_ARGS+=("(.class == \"$2\")")
            shift
            shift
            ;;
        -C|--initialClass)
            FILTER_ARGS+=("(.initialClass == \"$2\")")
            shift
            shift
            ;;
        -t|--title)
            FILTER_ARGS+=("(.title == \"$2\")")
            shift
            shift
            ;;
        -T|--initialTitle)
            FILTER_ARGS+=("(.initialTitle == \"$2\")")
            shift
            shift
            ;;
        *)
            POSITIONAL_ARGS+=("$1")
            shift
            ;;
    esac
done

FILTERSTR=$(printf " and %s" "${FILTER_ARGS[@]}")
FILTER=${FILTERSTR:5}
APPLICATION=${POSITIONAL_ARGS[0]}

if [[ $FILTER == "" ]]; then
   echo "no filter specified"
   exit 1
fi

if [[ $APPLICATION == "" ]]; then
   echo "no application specified"
   exit 1
fi

# echo "filter: $FILTER"
# echo "app: $APPLICATION"

pid=$(hyprctl -j clients | jq -r ".[] | select(${FILTER}) | .pid")
# echo "pid: ${pid}"

if [[ $pid != "" ]]
then
    hyprctl dispatch focuswindow "pid:$pid"
else
    hyprctl dispatch exec "$APPLICATION"
fi
