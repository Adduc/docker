#!/bin/bash
# Startup Script
#
# This script is meant to be run when starting the base docker
# container. It initializes and runs services as required.
##

##
# Start Postfix to allow emails to be sent
##
service postfix start

##
# Ensure container does not stop
##
[ "$1" != "notail" ] && tail -f /dev/null
