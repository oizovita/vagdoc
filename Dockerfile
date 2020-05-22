FROM php:7.4.4-fpm AS s2

RUN apt-get update && apt-get install -y autoconf build-essential

RUN apt-get install -y \
    git \
    zip \
    curl \
    sudo \
    unzip \
    libpq-dev \
    libonig-dev \
    libicu-dev \
    libbz2-dev \
    libpng-dev \
    libjpeg-dev \
    libmcrypt-dev \
    libreadline-dev \
    libfreetype6-dev \
    g++

RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/

RUN docker-php-ext-install \
    bz2 \
    pdo \
    intl \
    pgsql \
    iconv \
    bcmath \
    opcache \
    calendar \
    mbstring \
    pdo_pgsql \
    gd

WORKDIR /var/www/html/app

COPY ./ ./

EXPOSE 9000

RUN chmod 755 src/