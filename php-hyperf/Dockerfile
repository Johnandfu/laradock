# Default Dockerfile

FROM hyperf/hyperf:8.0-alpine-v3.16-swoole
ARG timezone

ENV TIMEZONE=${timezone:-"Asia/Shanghai"} 
 # APP_ENV=prod \
 # SCAN_CACHEABLE=(true)
WORKDIR /var/www/hcms

# update
RUN set -ex \
  # show php version and extensions
  && php -v \
  && php -m \
  && php --ri swoole \
  #  ---------- some config ----------
  && cd /etc/php8 \
  # - config PHP
  && { \
  echo "upload_max_filesize=128M"; \
  echo "post_max_size=128M"; \
  echo "memory_limit=1G"; \
  echo "date.timezone=${TIMEZONE}"; \
  } | tee conf.d/99_overrides.ini \
  # - config timezone
  && ln -sf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
  && echo "${TIMEZONE}" > /etc/timezone \
  # ---------- clear works ----------
  && rm -rf /var/cache/apk/* /tmp/* /usr/share/man \
  && echo -e "\033[42;37m Build Completed :).\033[0m\n"


EXPOSE 9066

#CMD ["php-fpm"]
ENTRYPOINT ["php", "/var/www/hcms/bin/hyperf.php", "server:watch"]

