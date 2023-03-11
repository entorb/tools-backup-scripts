@echo off

TITLE Backup Documents

set source="C:\Users\torben\Documents"

@REM store current date as variable
set DATESTR=%date:~-2,4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%
@REM replace ' ' in small hours with 0
set DATESTR=%DATESTR: =0%
@REM write current date to file inside source folder
set datefile=%source%\0backup-date-U.txt
echo %DATESTR% > %datefile%
@REM date /T > %datefile%
@REM time /T >> %datefile%

set excludeDirs="C:\Users\torben\Documents\.git" ^
 "C:\Users\torben\Documents\Custom Office Templates"
@REM not ^ at last line

set excludeFiles="my File 1. txt" ^
 "*.ext" ^
 "my File 2.zip"
@REM not ^ at last line

set target="\\myServer\torben\sicher\doks-KOPIE"
robocopy %source% %target% /MIR /FFT /Z /R:10 /W:5 /MT:8 /NP /NS /NC ^
 /XD %excludeDirs% /XF %excludeFiles% 

del %datefile%

@REM old stuff
@REM net use u: \\myServer\torben\
@REM net use u: /delete

@REM echo remove write protection
@REM attrib -r %target%\*.* /s
@REM echo set write protection
@REM attrib +r %target%\*.* /s
