FROM dunglas/frankenphp:1.12.3-php8.5

RUN install-php-extensions \
    pdo_mysql \
    mysqli \
    redis \
    pcntl \
    bcmath \
    zip \
    intl \
    opcache

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /app

EXPOSE 8000


CMD ["php", "artisan", "octane:start", "--server=frankenphp", "--host=0.0.0.0", "--port=8000"]