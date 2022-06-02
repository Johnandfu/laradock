FROM alpine:latest
USER root
WORKDIR /data

RUN apk --no-cache add redis 
COPY  redis.conf /etc/redis.conf
EXPOSE 6379
ENTRYPOINT ["redis-server", "/etc/redis.conf"]
HEALTHCHECK CMD redis-cli ping
