FROM openjdk:8-jdk-alpine
ENV EAGLE_VERSION=2.0.6
ENV KE_HOME=/opt/kafka-eagle
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
     && apk update \
     && apk add curl sqlite bash \
     && mkdir -p /opt/kafka-eagle/conf;cd /opt \
     && curl -OL "https://github.com.cnpmjs.org/smartloli/kafka-eagle-bin/archive/v${EAGLE_VERSION}.tar.gz" \
     && tar zxvf v${EAGLE_VERSION}.tar.gz -C kafka-eagle --strip-components 1 \
     && cd kafka-eagle;tar zxvf kafka-eagle-web-${EAGLE_VERSION}-bin.tar.gz --strip-components 1 \
     && rm kafka-eagle-web-${EAGLE_VERSION}-bin.tar.gz \
     && mkdir -p /hadoop/kafka-eagle/db \
     && touch /opt/kafka-eagle/logs/log.log 
    
WORKDIR /opt/kafka-eagle
ADD system-config.properties /opt/kafka-eagle/conf/system-config.properties
ADD entrypoint.sh /opt/kafka-eagle/entrypoint.sh
ENTRYPOINT ["sh","/opt/kafka-eagle/entrypoint.sh"]
EXPOSE 8048
