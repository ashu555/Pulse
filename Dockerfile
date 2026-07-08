# syntax=docker/dockerfile:1

# -----------------------------------------------------------------------------
# Stage 1: Install PHP dependencies
# -----------------------------------------------------------------------------
FROM composer:2 AS vendor

WORKDIR /app

COPY composer.json composer.lock ./

RUN composer install \
    --no-dev \
    --no-interaction \
    --no-scripts \
    --prefer-dist \
    --optimize-autoloader

COPY . .

RUN composer dump-autoload --optimize --classmap-authoritative

# -----------------------------------------------------------------------------
# Stage 2: Build frontend assets
# -----------------------------------------------------------------------------
FROM node:22-alpine AS assets

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci --ignore-scripts

COPY vite.config.js postcss.config.js tailwind.config.js ./
COPY resources ./resources
COPY public ./public

RUN npm run build

# -----------------------------------------------------------------------------
# Stage 3: Production runtime (PHP-FPM + extensions)
# -----------------------------------------------------------------------------
FROM php:8.4-fpm-alpine AS production

LABEL org.opencontainers.image.title="Pulse"
LABEL org.opencontainers.image.description="Laravel application visualization platform"

RUN apk add --no-cache \
    bash \
    curl \
    fcgi \
    freetype \
    icu-libs \
    libjpeg-turbo \
    libpng \
    libzip \
    oniguruma \
    freetype-dev \
    icu-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libzip-dev \
    oniguruma-dev \
    $PHPIZE_DEPS \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j"$(nproc)" \
        bcmath \
        gd \
        intl \
        mbstring \
        opcache \
        pcntl \
        pdo_mysql \
        zip \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && apk del \
        $PHPIZE_DEPS \
        freetype-dev \
        icu-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        libzip-dev \
        oniguruma-dev \
    && rm -rf /tmp/pear /var/cache/apk/*

COPY docker/php/php.ini /usr/local/etc/php/conf.d/99-pulse.ini

WORKDIR /var/www/html

COPY --from=vendor --chown=www-data:www-data /app /var/www/html
COPY --from=assets --chown=www-data:www-data /app/public/build /var/www/html/public/build

COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN mkdir -p storage/framework/{cache,sessions,views} storage/logs bootstrap/cache \
    && chown -R www-data:www-data storage bootstrap/cache

USER www-data

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["php-fpm"]

# -----------------------------------------------------------------------------
# Stage 4: Production nginx (static files + reverse proxy)
# -----------------------------------------------------------------------------
FROM nginx:1.27-alpine AS production-nginx

COPY docker/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=production /var/www/html/public /var/www/html/public

# -----------------------------------------------------------------------------
# Stage 5: Local development image
# -----------------------------------------------------------------------------
FROM production AS development

USER root

RUN apk add --no-cache nodejs npm git mysql-client

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
