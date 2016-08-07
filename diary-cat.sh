#!/bin/bash

if [ -z "$DIARY" ]
then
    echo "Please set the DIARY variable to point to the diary text file"
    exit 1
fi

tmp=`mktemp`
gpg  -q --decrypt --output "$tmp" --yes "$DIARY" 
cat "$tmp"
rm "$tmp"
