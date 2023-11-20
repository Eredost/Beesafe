FROM php:8.2-fpm-alpine3.18

RUN apk update && \
    apk add --no-cache apache2 apache2-proxy && \
    rm -rf /var/cache/apk/*

RUN mkdir -p /var/run/php
COPY docker/php/www.conf /usr/local/etc/php-fpm.d/zz-docker.conf

RUN docker-php-ext-install mysqli \
    && docker-php-ext-enable mysqli

RUN mkdir -p /var/www/www.beesafe.co
COPY docker/php/apache.conf /etc/apache2/conf.d/
COPY public /var/www/www.beesafe.co

EXPOSE 80

WORKDIR /var/www/www.beesafe.co

CMD ["sh", "-c", "php-fpm -D && httpd -D FOREGROUND"]
