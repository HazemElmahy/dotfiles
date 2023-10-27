# dotfiles
-- Backup of my dotfiles

my previous method of backing up dotfiles
was to soft link files all the files from dotfiles to the desired directory
which I think was a better solution but too much work when reinstalling 
I probably should use this method again but with installing script

current backing up method is to run the `mkbackup.sh backup` which will copy all the files to /home/$USER/dotfiles
and TODO -> I will reverse the actions done in backup when run `mkbuckup.sh install`
