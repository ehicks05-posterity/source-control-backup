@echo off

set outputDir=C:\Dropbox\svnBackup
set logFile=%outputDir%\svnBackup.log
set tempDir=C:\temp
set repoDir=c:\Repositories

echo Starting backup... %date% %time% >> %logFile%

REM Dump repository data
for %%x in (
        repo1
        repo2
		repo3
       ) do (
		echo Dumping %%x >> %logFile%
		svnadmin dump %repoDir%\%%x > %tempDir%\%%x.dump
       )

REM add all .dump files to a 7z archive
7z a -mx9 -mmt -t7z %tempDir%\svnBackup.7z %tempDir%\*.dump >> %logFile%

REM Copy 7z to DropBox
set backupFileDate=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
copy /Y %tempDir%\svnBackup.7z %outputDir%\svnBackup%backupFileDate%.7z >> %logFile%

REM Clean up
del %tempDir%\*.dump
del %tempDir%\svnBackup.7z

echo Backup done... %date% %time% >> %logFile%
echo ------------------------------------------ >> %logFile%