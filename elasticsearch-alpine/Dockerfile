FROM alpine:3.15

LABEL maintainer "https://github.com/blacktop"
ENV VERSION 8.1.2
WORKDIR /opt/elasticsearch
ADD ./start.sh /opt/elasticsearch/start.sh
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
  && apk add --no-cache -t .build-deps wget ca-certificates gnupg openssl curl \
  && apk add --no-cache bash openjdk17-jre-headless su-exec \
  && apk --update  add  curl bash  openjdk14-jre \
  && curl -k https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.3.2-no-jdk-linux-x86_64.tar.gz | tar -zxvf - -C /opt/elasticsearch --strip-components 1   \
  && chmod a+x /opt/elasticsearch/start.sh \
  && apk del --purge .build-deps

EXPOSE 9200 9300
ENTRYPOINT ["/opt/elasticsearch/start.sh"]
CMD ["elasticsearch"]

# HEALTHCHECK CMD ["docker-healthcheck"]
