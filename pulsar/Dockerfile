FROM adoptopenjdk/openjdk15:alpine-slim
ENV version 2.10.1
ENV download 2.10.1-bin
ENV PULSAR_HOME /opt/sh/pulsar
WORKDIR /opt/sh
USER root
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
  && apk --no-cache  add  wget bash  libstdc++ \
  && wget -q https://mirrors.tuna.tsinghua.edu.cn/apache/pulsar/pulsar-${version}/apache-pulsar-${download}.tar.gz  \
  && mkdir -p /opt/sh/pulsar \
  && tar -xf apache-pulsar-${download}.tar.gz -C /opt/sh/pulsar --strip-components 1  \
  && rm -rf apache-pulsar-${download}.tar.gz
WORKDIR /opt/sh/pulsar
CMD [ "bin/pulsar", "standalone" ]
EXPOSE  2181 3181 4181 6650 8080
