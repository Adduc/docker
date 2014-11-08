# Base Image
FROM ubuntu:14.04

# Repositories
RUN echo "deb http://ppa.launchpad.net/ondrej/php5-5.6/ubuntu trusty main" >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-key E5267A6C

# Common Applications
RUN apt-get update
RUN apt-get install -y nano htop postfix

# Set startup script
ADD startup.sh /opt/base-startup.sh
CMD bash /opt/base-startup.sh

