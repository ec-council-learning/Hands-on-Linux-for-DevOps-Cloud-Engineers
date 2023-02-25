#!/bin/bash

# Check for the directory argument passed in
backup_dir=""
if [ -z $1 ]
then
	# set the directory to engineering if nothing was passed in
	backup_dir="/usr/local/engineering"
else
	backup_dir=$1
fi

# check the directory passed in exists
if [ ! -d $backup_dir ]
then
	echo "The $backup_dir directory does not exist. Backup halted"
	exit 1
fi

# archive name
backup_file_name=/tmp/engineering_$(date +%Y-%m-%d_%H%M%S).tar.gz

# get a count of the files in the directory to be backedup
function files_to_be_backed_up {
	find $backup_dir -type f | wc -l
}


# create the backup archive
echo "Backing up $(files_to_be_backed_up) files"
# send any errors to the backup.log file
tar -czf $backup_file_name $backup_dir 2> /tmp/backup.log

# check for backup archive
if [ -f $backup_file_name ]
then
	echo "Backup succeeded!"
else
	echo "Backup failed!"
fi
