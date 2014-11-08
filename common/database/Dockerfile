FROM 128io/base

RUN apt-get install -y mysql-server-5.6

RUN sed -i 's/bind-address.*//' /etc/mysql/my.cnf

ADD startup.sh /opt/database-startup.sh
CMD bash /opt/database-startup.sh

