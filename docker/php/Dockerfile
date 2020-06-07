FROM php:7.4-fpm

ARG USER_ID

RUN apt-get update && apt-get -yq install git
RUN docker-php-ext-install pdo_mysql

COPY --from=composer /usr/bin/composer /usr/bin/composer

COPY bin/* /usr/bin/
RUN chmod +x /usr/bin/*

RUN if [ ! -z ${USER_ID} ]; then usermod -u ${USER_ID} www-data; fi
RUN if [ ! -z ${USER_ID} ]; then groupmod -g ${USER_ID} www-data; fi
RUN mkdir -p /var/www/.composer/cache
RUN mkdir -p /var/www/project/{bin,config,migrations,public,src,templates,tests,translations,var}
RUN chown -R www-data:www-data /var/www

WORKDIR /var/www/project
CMD docker-entrypoint.sh

EXPOSE 9000