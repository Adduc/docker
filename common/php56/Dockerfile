FROM 128io/base

RUN apt-get install -y mysql-client nginx

RUN apt-get install -y php5-cli php5-mysqlnd php5-mcrypt php5-intl php5-fpm

RUN rm -r /etc/nginx/sites-enabled/*

# Configure PHP-FPM
RUN sed -i 's#\(error_log\).*#\1 = /var/log/php/fpm.log#' /etc/php5/fpm/php-fpm.conf \
    && echo "php_admin_value[error_log] = /var/log/php/php.log" >> /etc/php5/fpm/pool.d/www.conf

# Default nginx configuration
ADD default-nginx.conf /etc/nginx/sites-enabled/virtual-host.conf

ADD startup.sh /opt/php56-startup.sh
CMD bash /opt/php56-startup.sh
