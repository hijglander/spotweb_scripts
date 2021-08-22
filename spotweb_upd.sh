#!/bin/sh
# Upgrade script for Spotweb.
#
# Author: J. van Emden (Brickman)
# Latest version: http://dl.dropbox.com/u/5653370/synology.html
#
# Thanks to:
#   Mar2zz -                http://mar2zz.tweakblogs.net/blog/6724/spotweb-als-provider.html
#
# Version:
# 2021-08-22:
# - Adapted spotweb dir to accommodate for Linux installations with lighttpd
#
# 2012-03-04:
# - Temp file changed to /tmp/
#
# 2012-02-07:
# - PATH variable modified to include the bootstrap directory
#
# 2011-12-11:
# - Hibernation problem seems to be fixed now the tmp file is on /volume1
#
# 2011-12-10:
# - Git pull fixed
#
# 2011-12-03:
# - Git returned an error
#
# 2011-11-28:
# - Go to the spotweb directory to overcome missing files before the git pull is done
#
# 2011-11-26:
# - Logging removed to new file
#
# 2011-11-20:
# - Added some more variable to the script
# - Built-in check to see if git changed some files
#
#------------------------------------------
# Update spotweb
#

# Directory to spotweb
PATH_TO_SPOTWEB="/var/www/html/spotweb";     # Path to spotweb

##########################################
##########################################
## Do not edit after this line!         ##
##########################################
##########################################


PATH=/opt/bin:/opt/sbin:$PATH               # Add bootstrap directory to PATH

PATH_TO_PHP=/usr/bin/php;                   # PHP executable
GIT_APP=$(which git);                       # Find the git executable
GIT_APP="$GIT_APP pull";
TMP_FILE="/tmp/.spotweb-upgrade";           # Tmp file variable

echo "======================"
echo -n `date +%Y-%m-%d\ %H:%M:%S`
echo ": Updating Spotweb"
echo "";

# Check if the update process isn't running
#  if so exit this update
if [ -f $TMP_FILE ]; then
    echo "The Spotweb update is already running;";
    echo "If wrong remove the tempfile by yourself!";
    exit
fi

# Create tempfile, as the update process isn't running
touch $TMP_FILE
wait

echo "First update Spotweb self."
# Go to the spotweb directory
cd $PATH_TO_SPOTWEB

echo "Git results: "
if $GIT_APP | grep 'files changed'; then
    echo "Updated to the latest version!"
    echo "Then wait untill the pull is completed"
    wait;
    echo "Start the database upgrade, to incorporate db changes"
    echo "Upgrade-db results: "
    $PATH_TO_PHP upgrade-db.php
    wait
    # Clean up the tmp file, otherwise update is run once
    rm $TMP_FILE
else
    echo "No update available"
    # Clean up the tmp file, otherwise update is run once
    rm $TMP_FILE
fi

echo ""
echo -n `date +%Y-%m-%d\ %H:%M:%S`
echo ": Updating Spotweb ended"
echo "======================"
