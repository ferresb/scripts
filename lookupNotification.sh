#!/bin/bash

if [ -z "$1" ];
then
    TIME="30m"
else
    TIME="$1"
fi

while [ 1 ];
do
    notify-send -i /home/ferresb/work/scripts/mountain.png -w -u critical Lookup "Time to look up !"
    sleep $TIME
done
