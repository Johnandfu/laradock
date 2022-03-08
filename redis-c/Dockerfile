FROM redis:alpine

LABEL maintainer="Mahmoud Zalt <mahmoud@zalt.me>"

## For security settings uncomment, make the dir, copy conf, and also start with the conf, to use it
RUN  mkdir -p /usr/local/etc/redis
RUN  apk add bash
COPY redis.conf /usr/local/etc/redis/redis.conf
COPY docker-entrypoint.sh /docker-entrypoint.sh

VOLUME /data
USER root
EXPOSE 6379 16379


#CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
ENTRYPOINT ["bash","/docker-entrypoint.sh"]

#CMD ["redis-server"]

#redis-cli --cluster create redis:6379 redis2:6379 redis3:6379 redis4:6379 redis5:6379 redis6:6379 redis7:6379 redis8:6379 --cluster-replicas 1
