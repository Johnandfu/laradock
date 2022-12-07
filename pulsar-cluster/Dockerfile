#FROM adoptopenjdk/openjdk15:alpine-slim
FROM alpine:latest
ENV version=2.10.2
ENV download=2.10.2-bin
ENV PULSAR_HOME=/opt/pulsar
WORKDIR /opt/pulsar
USER root
ADD ./start_pulsar.sh /opt/pulsar/
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
  && apk --update  add  curl bash  openjdk14-jre \
  && curl -k "http://mirrors.ustc.edu.cn/apache/pulsar/pulsar-${version}/apache-pulsar-${download}.tar.gz" | tar -zxvf - -C /opt/pulsar --strip-components 1   \
  && apk del curl \
  && chmod a+x /opt/pulsar/start_pulsar.sh

ENTRYPOINT ["bash", "-c","/opt/pulsar/start_pulsar.sh"]
#CMD [ "bin/pulsar", "standalone" ]
EXPOSE  2181 3181 4181 6650 8080
