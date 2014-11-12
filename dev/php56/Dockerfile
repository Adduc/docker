FROM 128io/php56

RUN apt-get install php5-xdebug

RUN sed -i 's/^\(display_errors\).*/\1 = On/' /etc/php5/fpm/php.ini

RUN sed -i 's/^\(pm\..*\)=.*/\1 = 1/' /etc/php5/fpm/pool.d/www.conf
