FROM redis:alpine

LABEL maintainer="Mahmoud Zalt <mahmoud@zalt.me>"
ENV BUILD_DEPS="gettext"  \
    RUNTIME_DEPS="libintl"

## For security settings uncomment, make the dir, copy conf, and also start with the conf, to use it
RUN  mkdir -p /usr/local/etc/redis
RUN  apk add bash && \
  apk add --update $RUNTIME_DEPS && \
  apk add --virtual build_deps $BUILD_DEPS &&  \
  cp /usr/bin/envsubst /usr/local/bin/envsubst && \
  apk del build_deps
COPY redis-cluster.tmpl /usr/local/etc/redis/redis-cluster.tmpl
COPY redis.conf /usr/local/etc/redis/redis.conf
COPY docker-entrypoint.sh /docker-entrypoint.sh

VOLUME /data
USER root
EXPOSE 6379 16379
ENTRYPOINT ["bash","/docker-entrypoint.sh"]
