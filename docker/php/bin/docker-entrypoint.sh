#!/usr/bin/env bash

cd /var/www/project
COMPOSER_MEMORY_LIMIT=2G composer install

CONTAINER_STARTED=bin/container-started.sh
if test -f "$CONTAINER_STARTED"; then
    source $CONTAINER_STARTED
fi

php-fpm