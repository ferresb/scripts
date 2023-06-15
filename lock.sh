#!/bin/bash

DIR=~/tmp

scrot $DIR/screenshot.png
convert $DIR/screenshot.png -blur 0x5 $DIR/screenshotblur.png
i3lock -i $DIR/screenshotblur.png
