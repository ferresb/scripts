#!/bin/bash

DATE=$(date +'%d_%m_%Y')

ROOT="/home/ferresb"
WORKPATH=$ROOT/work
TARGET=$ROOT/tmp/archive_$DATE
TARGET_ROOT=$TARGET/root

FILES=(".bash_aliases" ".bashrc" ".vimrc" ".vim" ".gitconfig" ".ssh" "keepass" ".screenlayout" ".config/awesome" "Documents" ".tmux.conf" "Zotero")

PROGRAM_DIR=$ROOT/program
PROGRAM_LIST=`ls $PROGRAM_DIR`
PROGRAM_LIST_FILE=$TARGET_ROOT/program_list.txt

cp -r "$WORKPATH" "$TARGET"
mkdir $TARGET_ROOT

echo $PROGRAM_LIST > $PROGRAM_LIST_FILE

for ((i = 0; i < ${#FILES[@]}; i++))
do
    cp -r $ROOT/"${FILES[$i]}" $TARGET_ROOT
done

tar -czf $TARGET.tar.gz $TARGET
