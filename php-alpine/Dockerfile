#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "apply-templates.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

FROM php:7.3-fpm-alpine

USER root

#FROM php:7.4-fpm-alpine3.12
WORKDIR /var/www/tp
ADD  https://ghproxy.com/https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/


RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \ 
  chmod +x /usr/local/bin/install-php-extensions && \
  apk add --no-cache --virtual .build-deps\
  && apk --no-cache add  autoconf gcc g++ make  graphicsmagick zip zlib-dev libjpeg-turbo-dev libpng-dev freetype freetype-dev imagemagick-dev libzip-dev libwebp-dev \
  # && curl -sS https://getcomposer.org/installer | php \
  # && mv composer.phar /usr/local/bin/composer \
  # && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
  # && docker-php-ext-install gd \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/lib/ --with-png-dir=/usr/lib/ --with-jpeg-dir=/usr/lib/ --with-gd \
  # && docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp \
  && docker-php-ext-install -j$(nproc) gd \
  && install-php-extensions pcntl mcrypt exif mysqli pdo_mysql zip sockets  imagick   amqp redis  bcmath \
  && apk del .build-deps \
  && rm -rf /var/cache/apk/* \
  && rm -rf /tmp/pear 
EXPOSE 9000 9998
CMD ["php-fpm"]
