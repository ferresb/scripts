#!/bin/bash

DATE=$(date +'%d_%m_%Y')

ROOT="/home/ferresb"
WORKPATH=$ROOT/work
TARGET=$ROOT/tmp/archive_$DATE
TARGET_ROOT=$TARGET/root

FILES=(".bash_aliases" ".bashrc" ".vimrc" ".vim" ".ssh" ".mozilla")

cp -r "$WORKPATH" "$TARGET"
mkdir $TARGET_ROOT

for ((i = 0; i < ${#FILES[@]}; i++))
do
    cp -r $ROOT/"${FILES[$i]}" $TARGET_ROOT
done

tar -czf $TARGET.tar.gz $TARGET
