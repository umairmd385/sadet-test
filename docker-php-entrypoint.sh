#!/bin/sh
set -e
# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php-fpm "$@"
fi
sleep 20
cd /var/www/html
php artisan migrate 
php artisan serve --host=0.0.0.0 --port=9000
exec "$@"
