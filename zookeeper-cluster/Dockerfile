FROM alpine:3.15
LABEL name="zookeeper"
WORKDIR /opt/zookeeper
ADD  ./entrypoint.sh /opt/zookeeper/entrypoint.sh
ARG ZOOKEEPER_VERSION=${ZOOKEEPER_VERSION}
USER root
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
  && apk add curl openjdk14-jre bash\
 # && adduser -D -g 'www' www\
  && curl -k  "https://mirrors.tuna.tsinghua.edu.cn/apache/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz" | tar -zxvf - -C /opt/zookeeper   --strip-components 1 \ 
  && cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg \
  && chmod a+x /opt/zookeeper/entrypoint.sh \
  && mkdir -p /var/zookeeper \
  && apk del curl

EXPOSE 2181 2888 3888 7000
ENTRYPOINT ["/opt/zookeeper/entrypoint.sh"]
