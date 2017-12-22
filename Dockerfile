FROM php:7-apache

MAINTAINER Fuat Taneri<fuat.taneri@eventim.de>

RUN    apt-get update \
    && apt-get install -y git zlib1g-dev libgd-dev libmcrypt-dev libxml2-dev libxslt-dev libmagickwand-dev stunnel4 --no-install-recommends\
    && docker-php-ext-install pdo_mysql zip bcmath gd soap xmlrpc xsl opcache \
    && pecl install apcu-5.1.8 \
    && docker-php-ext-enable apcu \
    && pecl install redis-3.1.4 \
    && docker-php-ext-enable redis \
    && pecl install imagick-3.4.3 \
    && docker-php-ext-enable imagick \
    && a2enmod rewrite

