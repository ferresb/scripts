#!/bin/bash

DIR=~/tmp

rm -f $DIR/screenshot.png $DIR/screenshotblur.png

scrot $DIR/screenshot.png
convert $DIR/screenshot.png -resize 5% $DIR/screenshotblur.png
convert $DIR/screenshotblur.png -resize 2000% $DIR/screenshotblur.png
i3lock -i $DIR/screenshotblur.png
