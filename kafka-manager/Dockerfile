# FROM  kafkamanager/kafka-manager:latest
# LABEL maintainer="seefuf@gmail.com"
# EXPOSE 9000
FROM  alpine:latest
ARG CMAK_VERSION="3.0.0.5"
WORKDIR /cmak
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \ 
    && echo "https://mirrors.tuna.tsinghua.edu.cn/alpine/edge/main" /etc/apk/repositories \
    && echo "https://mirrors.tuna.tsinghua.edu.cn/alpine/edge/community " /etc/apk/repositories \
    && echo "https://mirrors.tuna.tsinghua.edu.cn/alpine/edge/testing" /etc/apk/repositories \
    && apk upgrade --update \
    && apk  --no-cache add curl zip bash  openjdk11-jdk\
    && curl -L https://hub.fastgit.org/yahoo/CMAK/releases/download/${CMAK_VERSION}/cmak-${CMAK_VERSION}.zip -o /tmp/cmak.zip \
    && unzip /tmp/cmak.zip -d /tmp \
    #&& ln -s /cmak-$CMAK_VERSION /var/cmak \
    && mv /tmp/cmak-$CMAK_VERSION/* /cmak \
    && rm -rf /tmp/cmak.zip \
    && rm -rf /tmp/cmak-$CMAK_VERSION 

COPY conf/application.conf /cmak/conf/application.conf
ENTRYPOINT ["./bin/cmak","-Dconfig.file=conf/application.conf"]
EXPOSE 9000
