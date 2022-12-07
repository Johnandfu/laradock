FROM alpine:3.13
ENV KAFKA_VERSION=3.3.1
ENV SCALA_VERSION=2.13
#ENV KAFKA_LISTENERS=kafka-kraft
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    #&& apk update \
    && apk add --no-cache bash curl jq  openjdk8-jre\
    && curl -k "http://mirrors.ustc.edu.cn/apache/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" | tar -xzf - -C /opt \
    && mv /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION} /opt/kafka \
    && apk del curl jq
USER root
WORKDIR /opt/kafka
COPY config/server.properties /opt/kafka/config/server.properties
COPY start_kafka.sh /bin/
CMD ["/bin/start_kafka.sh"]
