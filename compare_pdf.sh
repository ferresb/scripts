#!/bin/bash

if [ $# -ne 2 ]
then
    echo "Must provide two args, each begin an existing file"
    exit 1
fi

if [ ! -f $1 ]
then
    echo "First argument must be an existing file"
    exit 1
fi
if [ ! -f $2 ]
then
    echo "First argument must be an existing file"
    exit 1
fi

TMP_FOLDER=./tmp_files
OUTFILE=diff.pdf
mkdir -p ${TMP_FOLDER}

pdftk $1 burst output ${TMP_FOLDER}/1__page_%03d.pdf
pdftk $2 burst output ${TMP_FOLDER}/2__page_%03d.pdf

for file1 in `ls ${TMP_FOLDER} | grep "1__page*"`
do
    file2=$(echo $file1 | sed "s/1__page/2__page/g")
    counter=$(echo $file1 | sed "s/1__page_//g" | sed "s/.pdf//g")
    compare \
           -verbose \
           -debug coder \
           -log "%u %m:%l %e" \
           ${TMP_FOLDER}/$file1 \
           ${TMP_FOLDER}/$file2 \
           -compose src \
           ${TMP_FOLDER}/diff_${counter}.pdf
done

list=`ls ${TMP_FOLDER} | grep "diff_*"`
cd ${TMP_FOLDER}
pdftk ${list} cat output ${OUTFILE}
cd -
mv ${TMP_FOLDER}/${OUTFILE} .

rm -rf ${TMP_FOLDER}
