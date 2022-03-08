#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "apply-templates.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

FROM php:8.1.1-fpm-alpine3.15
USER root
#FROM php:7.4-fpm-alpine3.12
WORKDIR /var/www/tp
ADD https://github.com/mlocati/docker-php-extension-installer/releases/download/1.4.12/install-php-extensions /usr/local/bin/


RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \ 
chmod +x /usr/local/bin/install-php-extensions && \
    apk add --no-cache --virtual .build-deps\
    && apk --no-cache add composer autoconf gcc g++ make ffmpeg graphicsmagick zip zlib-dev libjpeg-turbo-dev libpng-dev freetype-dev imagemagick-dev libzip-dev libwebp-dev rabbitmq-c rabbitmq-c-dev  librdkafka-dev \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
    #&& docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp \ 
    && install-php-extensions exif mysqli pdo_mysql zip sockets  imagick rdkafka  amqp redis swoole \
    && apk del .build-deps \
    && apk update \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/pear 

#ENTRYPOINT ["composer", "config -g repo.packagist composer https://mirrors.aliyun.com/composer/"]
#ENTRYPOINT ["composer", "config -g repo.packagist composer https://mirrors.aliyun.com/composer/"]
EXPOSE 9000 9998
CMD ["php-fpm"]
