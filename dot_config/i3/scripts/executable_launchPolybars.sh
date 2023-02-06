#!/bin/bash

killall -q polybar

# verify if polybar is running
if pgrep -x "polybar" > /dev/null
then
    polybar-msg cmd restart
    polybar mainBar &
    polybar secondaryBar
else
    echo "Polybar is not running"
fi


