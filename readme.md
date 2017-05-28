# Source Control Backup Scripts for git & svn

## Motivation
Create nightly backups of your repositories to protect against:
1. The host of your repositories disappearing and taking all of your projects with them.
2. You somehow getting your repo in such a bad state that you would rather just restore from yesterday's backup.

As an added bonus, saving the backups to something like dropbox or onedrive results in off site backups.

## Overview

1. Dumps each repo to a single file (.bundle for git, .dump for svn)
   * if git, runs `git pull origin` first
2. Adds all the dumped repo files to a 7z archive
3. Saves the archive to a chosen location with a nicely formatted date title
4. Includes logging

## Requirements / Environment

1. Windows
2. Your repos 
3. git or svnadmin on your path
4. 7z on your path

## Instructions / Usage

1. Choose location for output
2. Choose name for log file
3. Choose location for the temp directory
4. Specify repo directory
5. List the names of the repos to be backed up
6. Set the batch file to run nightly with Task Scheduler
