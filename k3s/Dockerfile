FROM  docker:latest
LABEL maintainer "https://github.com/blacktop"


RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories\
    && apk add --no-cache wget bash coreutils curl su-exec\ 
    && apk add --no-cache -t .build-deps curl ca-certificates jq \
    && mkdir -p /opt/kafka \
    && rm -rf /tmp/* \
    && apk del --purge .build-deps
RUN export \
  http_proxy="http://192.168.3.55:1080/" \
  https_proxy="http://192.168.3.55:1080/" \
  && wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash

  EXPOSE 8080