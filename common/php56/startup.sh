#!/bin/bash

##
# Start base services
##
bash /opt/base-startup.sh notail

touch /var/log/php/php.log
chown www-data /var/log/php/php.log

##
# Start PHP5 to handle dynamic content
##
service php5-fpm start


##
# Start Nginx to handle serving content
##
nginx

##
# Ensure container does not stop
##
[ "$1" != "notail" ] && tail -f /dev/null
