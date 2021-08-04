FROM alpine:latest
LABEL maintainer "https://github.com/blacktop"

ENV KAFKA_VERSION 2.7.1
ENV SCALA_VERSION 2.13​​​

LABEL name="kafka" version=${KAFKA_VERSION}

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories\
    && apk add --no-cache openjdk8-jre bash coreutils tar su-exec\ 
    && apk add --no-cache -t .build-deps curl ca-certificates jq \
    && mkdir -p /opt/kafka \
    && curl -L   https://mirrors.tuna.tsinghua.edu.cn/apache/kafka/2.7.1/kafka_2.13-2.7.1.tgz -o /tmp/kafka.tgz \
    && tar -C /tmp -zxf /tmp/kafka.tgz\
    && mv /tmp/kafka_2.13-2.7.1/* /opt/kafka \
    && adduser -DH -s /sbin/nologin kafka \
    && chown -R kafka: /opt/kafka \
    && rm -rf /tmp/* \
    && apk del --purge .build-deps

VOLUME   /data
COPY config/server.properties /opt/kafka/config/server.properties
#ADD config/zookeeper.properties /opt/kafka/config/
WORKDIR /opt/kafka
EXPOSE 9092
ENTRYPOINT  ["/bin/bash", "-c", " JMX_PORT=9988 /opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties"]
