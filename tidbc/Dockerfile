FROM  golang:alpine
LABEL maintainer="Mahmoud Zalt <mahmoud@zalt.me>"

ENV VERSION 6.0.0
WORKDIR /
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories  \ 
  && apk --no-cache add git make wget unzip dumb-init curl  binutils-gold gcc musl-dev dnsmasq\
  && go env -w GO111MODULE=on \
  && go env -w GOPROXY=https://mirrors.aliyun.com/goproxy/,direct \
  && mkdir -p $GOPATH/src/github.com/pingcap \
  && cd $GOPATH/src/github.com/pingcap \
  #&& export ALL_PROXY=http://127.0.0.1:10853 \
  && wget --no-check-certificate  https://mirror.ghproxy.com/https://github.com/pingcap/tidb/archive/refs/tags/v${VERSION}.zip -O tidb-v.zip \
  && unzip tidb-v.zip \
  && cd tidb-${VERSION} \
  && make \
  && mv ./bin/tidb-server /tidb-server \
  && rm -rf /$GOPATH/src/github.com/pingcap  /var/cache/apk/*

ENTRYPOINT ["/usr/bin/dumb-init", "./tidb-server"]
EXPOSE 4000
