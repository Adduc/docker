FROM 128io/base

RUN apt-get install -y nginx

ADD nginx.conf /etc/nginx/nginx.conf

ADD startup.sh /opt/proxy-startup.sh
CMD bash /opt/proxy-startup.sh
