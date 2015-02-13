#!/bin/bash

#source directory
SOURCE_DIRECTORY=""  # example: /var/www/project_name/media
#directory to backup
SSH_DESTINATION=""  # example: user@ip:/path/to/dumps/destination/

TEMP_DIRECTORY="/tmp/"
MYSQL_DATABASE_USER="root"
MYSQL_DATABASE_PASS="root"
MYSQL_DATABASE_NAME="database_name"

MYSQL_DUMP_FILENAME=$(date +%Y-%m-%d)"_backup.sql"
MEDIA_DUMP_FILENAME=$(date +%Y-%m-%d)"_media.tar.gz"

#backup mysql
mysqldump -u${MYSQL_DATABASE_USER} -p${MYSQL_DATABASE_PASS} ${MYSQL_DATABASE_NAME} > ${TEMP_DIRECTORY}${MYSQL_DUMP_FILENAME}

#backup images
tar -czPf ${TEMP_DIRECTORY}${MEDIA_DUMP_FILENAME} ${SOURCE_DIRECTORY}

#upload files to target server
echo "Uploading mysql dump..."
scp ${TEMP_DIRECTORY}${MYSQL_DUMP_FILENAME} ${SSH_DESTINATION}
rm ${TEMP_DIRECTORY}${MYSQL_DUMP_FILENAME}

echo "Uploading media dump..."
scp ${TEMP_DIRECTORY}${MEDIA_DUMP_FILENAME} ${SSH_DESTINATION}
rm ${TEMP_DIRECTORY}${MEDIA_DUMP_FILENAME}
