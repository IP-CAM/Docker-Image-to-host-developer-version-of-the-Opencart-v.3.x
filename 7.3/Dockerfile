FROM webdevops/php-nginx-dev:7.3

MAINTAINER Igor Goltsov <igor@ecomgems.com>

ENV WEB_DOCUMENT_ROOT=/phpapp
RUN sed -i 's/user www-data;/user application;/g' /etc/nginx/nginx.conf
RUN set -x \
    && pecl uninstall xdebug \
    && pecl install -f xdebug-2.9.8 \
    && apt update \
    && apt install --assume-yes pv unzip htop mc lsof default-mysql-client \
    && docker-image-cleanup

COPY conf/etc/nginx/vhost.conf /opt/docker/etc/nginx/vhost.conf
COPY conf/etc/nginx/vhost.common.d/10-php.conf /opt/docker/etc/nginx/vhost.common.d/10-php.conf
COPY conf/etc/nginx/vhost.common.d/10-location-root.conf /opt/docker/etc/nginx/vhost.common.d/10-location-root.conf
COPY conf/etc/nginx/conf.d/10-php.conf /opt/docker/etc/nginx/conf.d/10-php.conf
COPY conf/etc/php/fpm/pool.d/application.conf /opt/docker/etc/php/fpm/pool.d/application.conf

WORKDIR /phpapp
