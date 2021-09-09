FROM amazoncorretto:16
# https://hub.docker.com/_/openjdk

ENV KAFKA_DISTRIBUTION=http://mirror.nus.edu.sg/apache/kafka/2.8.0/kafka_2.13-2.8.0.tgz

RUN curl -s  --output /tmp/kafka.tgz ${KAFKA_DISTRIBUTION} && \
    yes | yum install tar gzip gettext && \
    mkdir kafka && tar -xvf /tmp/kafka.tgz --strip-components=1 --directory=kafka &&\
    rm -rf /tmp/kafka.tgz

WORKDIR /kafka

# How to start kafka without zookeeper
# https://github.com/apache/kafka/blob/2.8/config/kraft/README.md
ENV CLUSTER_UUID=fdNn7Hv3TRGrk32_j3k3Vg
ENV KAFKA_ADVERTISED_HOSTNAME=localhost

RUN ./bin/kafka-storage.sh format -t $CLUSTER_UUID -c ./config/kraft/server.properties

COPY ./config/broker.properties /config/
COPY ./config/server.properties /config/
COPY  ./start_broker.sh ./

EXPOSE 9092 9093

CMD [ "bash", "./start_broker.sh" ]

# FROM alpine:3.12

# RUN apk add --no-cache openjdk8-jre bash curl \
#   && mkdir -p /opt \
#   && curl -k "https://downloads.apache.org/kafka/2.8.0/kafka_2.13-2.8.0.tgz" | tar -xzf - -C /opt \
#   && mv /opt/kafka_2.13-2.8.0 /opt/kafka \
#   && adduser -DH -s /sbin/nologin kafka \
#   && chown -R kafka: /opt/kafka \
#   && rm -rf /tmp/*

# ENV PATH /sbin:/opt/kafka/bin/:$PATH

# USER kafka
# WORKDIR /opt/kafka

# RUN clusterID=`kafka-storage.sh random-uuid` \
#   && ./bin/kafka-storage.sh format -t $clusterID -c ./config/kraft/server.properties

# CMD ["kafka-server-start.sh", "config/kraft/server.properties"]
# EXPOSE 9092