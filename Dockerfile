FROM php:8.3.2-fpm
WORKDIR /var/www/html
RUN apt-get update \
    && apt-get install -y git curl libpng-dev libonig-dev libbz2-dev libfreetype6-dev libicu-dev libxml2-dev libjpeg-dev libmcrypt-dev libzip-dev libreadline-dev zip \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd \
    && echo "yes" | pecl install igbinary redis \
    && docker-php-ext-enable redis pdo_mysql
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY . .
COPY --chmod=755 docker-php-entrypoint.sh /
RUN composer update --ignore-platform-reqs \
    && php artisan key:generate \
    && php artisan optimize:clear \
    && mv php.ini /usr/local/etc/php
EXPOSE 9000
ENTRYPOINT [ "/docker-php-entrypoint.sh" ]
