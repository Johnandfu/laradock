FROM  golang:alpine
LABEL maintainer="Mahmoud Zalt <mahmoud@zalt.me>"
WORKDIR /
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories  \ 
    && apk --no-cache add git make \
    && go env -w GO111MODULE=on \
    && go env -w GOPROXY=https://mirrors.aliyun.com/goproxy/,direct \
    && mkdir -p $GOPATH/src/github.com/pingcap \
    && cd $GOPATH/src/github.com/pingcap \
    && export  https_proxy=http://dockerhost:10808 \
    && export  http_proxy=http://dockerhost:10808 \
    && git clone https://github.com/pingcap/tidb.git \
    && cd tidb \
    && make

WORKDIR $GOPATH/src/github.com/pingcap 
ENTRYPOINT ["/usr/local/bin", "./tidb-server"]
EXPOSE 4000
