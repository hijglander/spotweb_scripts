#!/bin/sh
# Cronjob script for updating spotweb
#
# Author: J. van Emden (Brickman)
# Latest version: http://dl.dropbox.com/u/5653370/synology.html
#
# Version:
# 2021-08-22:
# - Adapted log and script dir to accommodate for Linux installations
#
# 2011-11-26:
# - Initial release
#

# Directory where to store the log file
LOG_DIR="/var/log";

# Spotweb only folder
SPOT_LOG_DIR="${LOG_DIR}/spotweb";
LOG_TIME=$(date +%Y_%m_%d_%H_%M);
SPOT_LOG_FILE="${SPOT_LOG_DIR}/upd_${LOG_TIME}.log";

##########################################
##########################################
## Do not edit after this line!         ##
##########################################
##########################################

if [ ! -d $SPOT_LOG_DIR ]; then
    mkdir -p $SPOT_LOG_DIR
fi

sh /root/bin/spotweb_upd.sh > $SPOT_LOG_FILE 2>&1

