#!/bin/sh
# Cronjob script for retrieving new spots of spotweb
#
# Author: J. van Emden (Brickman)
# Latest version: http://dl.dropbox.com/u/5653370/synology.html
#
# Version:
# 2011-11-26:
# - Initial release
#

# Directory where to store the log file
LOG_DIR="/var/log";

# Spotweb only folder
SPOT_LOG_DIR="${LOG_DIR}/spotweb";
LOG_TIME=$(date +%Y_%m_%d_%H_%M);
SPOT_LOG_FILE="${SPOT_LOG_DIR}/retr_${LOG_TIME}.log";

##########################################
##########################################
## Do not edit after this line!         ##
##########################################
##########################################

if [ ! -d $SPOT_LOG_DIR ]; then
    mkdir -p $SPOT_LOG_DIR
fi

sh /root/bin/spotweb_retr.sh > $SPOT_LOG_FILE 2>&1
