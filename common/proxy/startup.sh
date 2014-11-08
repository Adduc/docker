#!/bin/bash

##
# Start base services
##
bash /opt/base-startup.sh notail

##
# Start Nginx to act as a proxy to other services
##
nginx

##
# Ensure container does not stop
##
[ "$1" != "notail" ] && tail -f /dev/null
