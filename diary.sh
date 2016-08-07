#!/bin/bash

if [ -z "$DIARY" ]
then
    echo "Please set the DIARY variable to point to the diary text file"
    exit 1
fi


tmp_dec=`mktemp`

stty -echo
printf "Password: "
read PASSWORD
stty echo
printf "\n"

if [ ! -f $DIARY ]
then
    echo "Creating Diary"
    #NOTE: not really secure on multiuser, since we pass the password as an argument, but this script is not built for hard security anyway...
    gpg -q --passphrase "$password" --output "$DIARY" --symmetric --yes "$tmp_dec"
fi

gpg -q --passphrase "$password" --output "$tmp_dec" --decrypt --yes "$DIARY"

until [  $? -eq 0 ]
do
    #Taken from http://stackoverflow.com/a/3980713
    stty -echo
    printf "Password: "
    read PASSWORD
    stty echo
    printf "\n"
    #NOTE: not really secure on multiuser, see note above
    gpg -q --passphrase "$password" --output "$tmp_dec" --decrypt --yes "$DIARY"
done


tmp_w=`mktemp`

date >> "$tmp_dec"
echo "---" >> "$tmp_dec"

$EDITOR "$tmp_w"

cat "$tmp_w" >> "$tmp_dec"
echo -e "\n" >> "$tmp_dec"

gpg -q --passphrase "$password" --output "$DIARY" --symmetric --yes "$tmp_dec"

rm "$tmp_w" "$tmp_dec"
