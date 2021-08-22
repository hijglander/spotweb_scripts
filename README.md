# spotweb_scripts
Scripts for downloading spots and updating spotweb via cron

Scripts are originally created by Brickman (J. van Emden : http://synology.brickman.nl/syn_howto/HowTo%20-%20install%20Spotweb.txt) for spotweb on a Synology NAS. 
The scripts have been adapted slightly to work on regular Linux installations.
Base install of spotweb with MariaDB and lighttpd is assumed.

Download the scripts to ~/bin (assuming root user so it will be /root/bin) and add the following lines to cron (crontab -e):

*/10    *       *       *       *       /bin/sh /root/bin/spotweb_cron_retr.sh > /dev/null

15      */6     *       *       *       /bin/sh /root/bin/spotweb_cron_upd.sh > /dev/null

Spots will be retrieved every 10 minutes and the spotweb files will be updated every 6 hours 15 minutes past the hour.
