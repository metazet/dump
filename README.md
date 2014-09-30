How it works
----------

For run this script, you need to set correct values for constants in the begin of script. After that, you can run this script.

Script are creating two files: mysql dump and tar.gz archive of selected directory. Script are creating this files in $TEMP_DIRECTORY and uploading they to $SSH_DESTINATION. After that, script are deleting temporary files.

Important
----------

You need to add public ssh key from source server to destination server, because files are uploading via ssh channel.