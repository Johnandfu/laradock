
FROM alpine:3.12
ENV EAGLE_VERSION=2.0.6
ENV KE_HOME=/opt/kafka-eagle
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
     && apk update \
     && apk add curl sqlite openjdk11-jdk \
     && mkdir -p /opt/kafka-eagle/conf;cd /opt \
     && curl -OL "https://github.com/smartloli/kafka-eagle-bin/archive/v${EAGLE_VERSION}.tar.gz" \
     && tar zxvf v${EAGLE_VERSION}.tar.gz -C kafka-eagle --strip-components 1 \
     && cd kafka-eagle;tar zxvf kafka-eagle-web-${EAGLE_VERSION}-bin.tar.gz --strip-components 1 \
     && rm kafka-eagle-web-${EAGLE_VERSION}-bin.tar.gz \
     && chmod +x /opt/kafka-eagle/bin/ke.sh \
     && mkdir -p /hadoop/kafka-eagle/db
WORKDIR /kafka-eagle
COPY system-config.properties ./conf/system-config.properties
COPY entrypoint.sh ./bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 8048