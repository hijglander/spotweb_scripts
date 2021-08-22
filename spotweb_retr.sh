#!/bin/sh
# Check for new spots for Spotweb.
#
# Author: J. van Emden (Brickman)
# Latest version: http://dl.dropbox.com/u/5653370/synology.html
#
# Thanks to:
#   Mar2zz -                http://mar2zz.tweakblogs.net/blog/6724/spotweb-als-provider.html
#
# Version:
# 2011-11-21:
# - Added some extra output to the script
#

# Enter path to spotweb
PATH_TO_SPOTWEB=/var/www/html/spotweb
PATH_TO_PHP=/usr/bin/php

echo "======================"
echo -n `date +%Y-%m-%d\ %H:%M`
echo ": Starting retrieval of new spots for Spotweb"
echo ""

# Goto to spotweb dir
cd  $PATH_TO_SPOTWEB

# Retrieve the new spots
$PATH_TO_PHP retrieve.php

echo ""
echo -n `date +%Y-%m-%d\ %H:%M`
echo ": Retrieval of new spots ended"
echo "======================"
