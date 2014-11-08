#!/bin/bash

##
# Start base services
##
bash /opt/base-startup.sh notail

##
# Create MySQL database if it doesn't exist.
##
if [ ! -f /var/lib/mysql/ibdata1 ]; then
    chown mysql /var/lib/mysql
    dpkg-reconfigure -f noninteractive mysql-server-5.6
    chmod 775 /var/lib/mysql

    /usr/bin/mysqld_safe > /dev/null 2>&1 &
    RET=1
    while [[ RET -ne 0 ]]; do
        sleep 1
        mysql -uroot -e "status" > /dev/null 2>&1
        RET=$?
    done

    mysql -uroot -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'changeme'"
    mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION"

    mysqladmin -uroot shutdown
fi

##
# Start Nginx to act as a proxy to other services
##
service mysql start

##
# Ensure container does not stop
##
[ "$1" != "notail" ] && tail -f /dev/null
