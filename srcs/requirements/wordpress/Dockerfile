FROM debian:oldstable

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y curl php-fpm php-mysql

RUN sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|g' /etc/php/7.4/fpm/pool.d/www.conf

WORKDIR /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php

COPY wp-cli.sh /etc/wp-cli.sh

ENTRYPOINT ["/bin/bash", "/etc/wp-cli.sh"]