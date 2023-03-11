@echo off

set rsync="c:\Users\t\Progs\rsync\rsync.exe"
:: from http://www.chip.de/downloads/rSync_33633578.html

set source=/cygdrive/"E/OneDrive/Files/"
:: store current date in a file
set file=E:\OneDrive\Files\date-last-Backup.txt
date /T > %file%
time /T >> %file%

echo === To D:\FilesKOPIE ===
set target=/cygdrive/"D/FilesKOPIE"
%rsync% -rthvz --modify-window=2 --exclude=.git --delete --delete-excluded %source% %target%

echo === To F3:\sicher\files\Files ===
set target=/cygdrive/"G/sicher/files/Files"
%rsync% -rthvz --modify-window=2 --exclude=.git --delete --delete-excluded %source% %target%

del %file%

