#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "apply-templates.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

FROM php:8.3-fpm-alpine


#FROM php:7.4-fpm-alpine3.12
WORKDIR /var/www/tp
ADD  https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

# Configure nginx - http
# COPY config/nginx.conf /etc/nginx/nginx.conf
# # Configure nginx - default server
# COPY config/conf.d /etc/nginx/conf.d/

# # Configure PHP-FPM
# ENV PHP_INI_DIR /etc/php84
# COPY config/fpm-pool.conf ${PHP_INI_DIR}/php-fpm.d/www.conf
# COPY config/php.ini ${PHP_INI_DIR}/conf.d/custom.ini

# Configure supervisord
ADD config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Make sure files/folders needed by the processes are accessable when they run under the nobody user
RUN chown -R nobody:nobody /var/www/ /run  /var/log/



RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
  && chmod +x /usr/local/bin/install-php-extensions  \
  && apk add --no-cache --virtual .build-deps ca-certificates supervisor bash  sed  curl tar  git openssl openssh  libpng-dev libjpeg-turbo-dev freetype-dev  libzip-dev  unzip\
  && curl -sS https://getcomposer.org/installer | php \
  && mv composer.phar /usr/local/bin/composer \
  && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
  && docker-php-ext-install gd \
  && docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg  \
  && docker-php-ext-install -j$(nproc) gd \
  && install-php-extensions pcntl mcrypt exif mysqli pdo_mysql zip sockets  swoole imagick   amqp redis  bcmath intl \
  && apk del .build-deps \
  && rm -rf /var/cache/apk/* \
  && rm -rf /tmp/pear 
EXPOSE 9000 9998 8000
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

# ENTRYPOINT ["php", "/var/www/beikeshop", "start"]
# CMD ["php-fpm"]
