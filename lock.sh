#!/bin/bash

DIR=~/tmp
SUSPEND=$1

rm -f $DIR/screenshot.png $DIR/screenshotblur.png

scrot $DIR/screenshot.png
convert $DIR/screenshot.png -resize 5% $DIR/screenshotblur.png
convert $DIR/screenshotblur.png -negate -resize 2000% $DIR/screenshotblur.png
i3lock -i $DIR/screenshotblur.png

# rm -f $DIR/screensaver.jpg
# convert /home/ferresb/.config/awesome/themes/default/nature.jpg $DIR/screensaver.png
# i3lock -t -i $DIR/screensaver.png

if [ $SUSPEND = "--suspend" ]
then
    systemctl suspend
fi
