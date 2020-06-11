#!/usr/bin/env bash

# Set timezone
ln -snf /usr/share/zoneinfo/${PHP_TIMEZONE} /etc/localtime
echo ${PHP_TIMEZONE} > /etc/timezone

# Install dependencies
cd /var/www/project
COMPOSER_MEMORY_LIMIT=-1 composer install

# Invoke custom container started hook
CONTAINER_STARTED=bin/container-started.sh
if test -f "$CONTAINER_STARTED"; then
    source $CONTAINER_STARTED
fi

php-fpm