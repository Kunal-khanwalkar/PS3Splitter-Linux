#!/bin/bash

#Friendship with Windows cancelled, now CLI tools on Linux is my new best friend

LARGE_FILES=`find "${PWD}/$@" -type f -print0 | du --files0-from=- -b -t 4294967295 | sed -E 's/[0-9]+\s//'`
echo "### Files larger than 4GB ###"
printf "$LARGE_FILES\n"
echo " --- "

while read -r FILE
do
    echo ""
    split -a 5 -b 4294967295 -d --numeric-suffixes=66600 --verbose "$FILE" "$FILE."
done <<< $LARGE_FILES
