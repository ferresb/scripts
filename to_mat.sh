#!/bin/bash

START=0
NCOL=$(( $1 - 1))
NROW=$(( $2 - 1))
OUT=out.png

rows=""
for (( ni=$START; ni<=$NCOL; ni++ ))
do
    tmp=""
    for (( nj=$START; nj<=$NROW; nj++ ))
    do
        index=$((ni * ($NROW + 1) + nj))
        file="model_$index.png"
        tmp="$tmp $file"
    done
    echo $tmp
    row="row_$ni.png"
    rows="$rows $row"
    convert $tmp -append $row
done
convert $rows +append out.png
