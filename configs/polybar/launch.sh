#!/usr/bin/env bash

dir="$HOME/.config/polybar"
themes=(`ls --hide="launch.sh" $dir`)

if [[ "$1" == "--docky" ]]; then
    style="docky"

    pkill polybar
    while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

    for m in $(polybar --list-monitors | cut -d":" -f1); do
        MONITOR=$m polybar --reload main -c "$dir/$style/config.ini"&
    done
fi
