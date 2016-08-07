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
