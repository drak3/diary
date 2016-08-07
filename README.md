# diary helpers
Small helper-scripts to help keeping a pgp-encrypted diary.
All scripts operate on the file specified by the enviroment variable `$DIARY`
#Scripts:
## diary
Write a new diary entry. Opens a new instance of `$EDITOR` on a temporary file. After closing, it appends the current date and the entry to the diary.
Will ask for a password on first run, which will be used to pgp-encrypt the diary.

## diary-read
Decrypts the diary and opens it in less

## diary-cat
Decrypts the diary and writes its content to standard output

#Dependencies
gpg

#Security
This is designed to protect the diary from casual snooping and assumes that it runs on a single user system that the diary keeper trusts and controls completely.
Also, the diary is not signed so there is no protection against data tampering.

Do not use this for sensitive information, unless you understand _exactly_ what these scripts are doing.
