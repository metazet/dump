How it works
----------

For run this script, you need to set correct values for constants in the begin of script. After that, you can run this script.

Script creates two files: mysql dump and tar.gz archive of selected directory. Script creates this files in $TEMP_DIRECTORY and uploads they to $SSH_DESTINATION. After that, script deletes temporary files.