#!/bin/bash

DATE=$(date +'%d_%m_%Y')

ROOT="/home/ferresb"
WORKPATH=$ROOT/work
TARGET=$ROOT/tmp/archive_$DATE
TARGET_ROOT=$TARGET/root

LOCAL_MAIL=$ROOT"/snap/thunderbird/common/.thunderbird/u4uxhqil.default-release/Mail/Local Folders"
BACKUP_MAIL=$TARGET_ROOT/thunderbird_local

FILES=(".bash_aliases" ".bashrc" ".vimrc" ".vim" ".gitconfig" ".ssh" "keepass" ".screenlayout" ".config/awesome" ".tmux.conf" "Zotero")
DOCUMENTS="Documents"

PROGRAM_DIR=$ROOT/program
PROGRAM_LIST=`ls $PROGRAM_DIR`
PROGRAM_LIST_FILE=$TARGET_ROOT/program_list.txt

cp -r "$WORKPATH" "$TARGET"
mkdir -p $TARGET_ROOT

echo $PROGRAM_LIST > $PROGRAM_LIST_FILE

for ((i = 0; i < ${#FILES[@]}; i++))
do
    cp -r $ROOT/"${FILES[$i]}" $TARGET_ROOT
done

# need a special treatment for ransomguard file...
rsync -a --exclude '.ransomguard.pdf' $ROOT/$DOCUMENTS $TARGET_ROOT

# backuping local mails
mkdir $BACKUP_MAIL
echo "$LOCAL_MAIL" > $BACKUP_MAIL/path.txt
cp -r "$LOCAL_MAIL" "$BACKUP_MAIL/local"

tar -czf $TARGET.tar.gz $TARGET
