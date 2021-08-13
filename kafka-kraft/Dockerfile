FROM alpine:3.13
ENV KAFKA_VERSION=2.8.0
ENV SCALA_VERSION=2.13
#ENV KAFKA_LISTENERS=kafka-kraft
RUN apk update \
    && apk add --no-cache bash curl jq  openjdk8-jre\
    && curl -k "https://mirrors.tuna.tsinghua.edu.cn/apache/kafka/2.8.0/kafka_2.13-2.8.0.tgz" | tar -xzf - -C /opt \
    && mv /opt/kafka_2.13-2.8.0 /opt/kafka \
    && apk del curl jq
USER root
WORKDIR /opt/kafka
COPY config/server.properties /opt/kafka/config/server.properties
COPY start_kafka.sh ./
ENTRYPOINT ["./start_kafka.sh"]
