#!/bin/sh

#creates symlinks for the scripts in a specified directory
ln -s "$PWD/diary.sh" "$1/diary"
ln -s "$PWD/diary-read.sh" "$1/diary-read"  
ln -s "$PWD/diary-cat.sh" "$1/diary-cat" 
