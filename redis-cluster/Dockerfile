FROM alpine:3.16
RUN addgroup -S -g 1000 redis && adduser -S -G redis -u 999 redis


RUN apk add --no-cache 'su-exec>=0.2' tzdata bash

ENV REDIS_VERSION 7.0.4
ENV REDIS_DOWNLOAD_URL http://download.redis.io/releases/redis-7.0.4.tar.gz
ENV REDIS_DOWNLOAD_SHA f0e65fda74c44a3dd4fa9d512d4d4d833dd0939c934e946a5c622a630d057f2f
WORKDIR /usr/src/redis
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
  && set -eux\
  && apk add --no-cache --virtual .build-deps coreutils dpkg-dev dpkg gcc linux-headers make musl-dev openssl-dev curl \

  && curl -k  http://download.redis.io/releases/redis-7.0.4.tar.gz | tar -zxvf - -C /usr/src/redis --strip-components 1   \
  && export BUILD_TLS=yes; 
# && make -C /usr/src/redis -j "$(nproc)" all; \
# && make -C /usr/src/redis install PREFIX=/usr/local/redis\
# && apk add --no-network --virtual .redis-rundeps $runDeps; \
# && apk del --no-network .build-deps; 

RUN mkdir /data && chown redis:redis /data
VOLUME /data
WORKDIR /data

ADD entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
EXPOSE 6379

