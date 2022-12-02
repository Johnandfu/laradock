FROM alpine:latest
ENV KAFKA_VERSION=3.3.1
ENV SCALA_VERSION=2.13
#ENV KAFKA_LISTENERS=kafka-kraft
WORKDIR /opt/kafka
ADD ./start_kafka.sh /opt/kafka
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
  #&& apk update \
  && apk add  bash curl jq openjdk14\
  && curl -k "https://mirrors.aliyun.com/apache/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" | tar -xzf - -C /opt/kafka  --strip-components 1 \
  #&& mv /opt/kafka_2.13-2.8.0 /opt/kafka \
  && apk del curl jq \
  && export JAVE_HOME=/lib/jvm/default-jvm/bin/java \
  && export JRE_HOME=/lib/jvm/default-jvm/bin/java 
USER root
EXPOSE 9092
ENTRYPOINT ["/bin/bash","-c","JMX_PORT=9988 /opt/kafka/start_kafka.sh" ]
