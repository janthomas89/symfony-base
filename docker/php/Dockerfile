FROM php:7.4-fpm

ARG USER_ID

RUN apt-get update && apt-get -yq install git zip unzip
RUN docker-php-ext-install pdo_mysql

# Composer
COPY --from=composer /usr/bin/composer /usr/bin/composer
COPY composer/config.json /var/www/.composer/config.json

# Custom extensions
RUN docker-php-ext-install opcache
RUN pecl install xdebug-2.9.6 && docker-php-ext-enable xdebug
COPY conf.d /usr/local/etc/php/conf.d

# Custom binaries
COPY bin/* /usr/bin/
RUN chmod +x /usr/bin/*

# Custom user
RUN if [ ! -z ${USER_ID} ]; then usermod -u ${USER_ID} www-data; fi
RUN if [ ! -z ${USER_ID} ]; then groupmod -g ${USER_ID} www-data; fi
RUN mkdir -p /var/www/.composer/cache
RUN mkdir -p /var/www/project/
RUN chown -R www-data:www-data /var/www

WORKDIR /var/www/project
CMD docker-entrypoint.sh

EXPOSE 9000