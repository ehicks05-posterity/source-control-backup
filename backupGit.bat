@echo on

set outputDir=C:\Dropbox\gitBackup
set logFile=%outputDir%\gitBackup.log
set tempDir=C:\temp
set repoDir=c:\gitrepos

echo Starting backup... %date% %time% >> %logFile%

REM Dump repository data
for %%x in (
        repo1
        repo2
		repo3
       ) do (
		cd %repoDir%\%%x
		echo Pulling and Dumping %%x >> %logFile%
		git pull origin >> %logFile%
		git bundle create %tempDir%\%%x.bundle --all >> %logFile%
       )

REM add all .bundle files to a 7z archive
7z a -mx9 -mmt -t7z %tempDir%\gitBackup.7z %tempDir%\*.bundle >> %logFile%

REM Copy 7z to DropBox
set backupFileDate=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
copy /Y %tempDir%\gitBackup.7z %outputDir%\gitBackup%backupFileDate%.7z >> %logFile%

REM Clean up
del %tempDir%\*.bundle
del %tempDir%\gitBackup.7z

echo Backup done... %date% %time% >> %logFile%
echo ------------------------------------------ >> %logFile%