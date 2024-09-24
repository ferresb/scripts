#!/bin/bash

AVAILABLE=`xrandr -q | grep " connected" | cut -d " " -f 1`

HAS_8=0
HAS_9=0
HAS_10=0

has() {
    for i in $AVAILABLE;
    do
        if [[ $i == *"$1"* ]]
        then
            return 1
        fi
    done
    return 0
}

has "8"
HAS_8=$?

has "9"
HAS_9=$?

has "10"
HAS_10=$?

if [ $HAS_8 -eq 1 -a $HAS_9 -eq 1 ];
then
    xrandr --output eDP --off --output HDMI-A-0 --off --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --off --output DisplayPort-3 --off --output DisplayPort-4 --off --output DisplayPort-5 --off --output DisplayPort-6 --off --output DisplayPort-7 --off --output DisplayPort-8 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output DisplayPort-9 --mode 2560x1440 --pos 2560x0 --rotate normal --output DisplayPort-10 --off
    echo "8++9"
    exit 0
fi

if [ $HAS_9 -eq 1 -a $HAS_10 -eq 1 ];
then
    xrandr --output eDP --off --output HDMI-A-0 --off --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --off --output DisplayPort-3 --off --output DisplayPort-4 --off --output DisplayPort-5 --off --output DisplayPort-6 --off --output DisplayPort-7 --off --output DisplayPort-8 --off --output DisplayPort-9 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output DisplayPort-10 --mode 2560x1440 --pos 2560x0 --rotate normal
    echo "9++10"
    exit 0
fi

if [ $HAS_8 -eq 1 -a $HAS_10 -eq 1 ];
then
    xrandr --output eDP --off --output HDMI-A-0 --off --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --off --output DisplayPort-3 --off --output DisplayPort-4 --off --output DisplayPort-5 --off --output DisplayPort-6 --off --output DisplayPort-7 --off --output DisplayPort-8 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output DisplayPort-9 --off --output DisplayPort-10 --mode 2560x1440 --pos 2560x0 --rotate normal
    echo "8++10"
    exit 0
fi

echo "No available confif. Aborting."
exit 1
