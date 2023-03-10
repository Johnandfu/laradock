FROM  golang:alpine
LABEL maintainer="Mahmoud Zalt <mahmoud@zalt.me>"
WORKDIR /go/web/go-admin
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories  \ 
    && apk --no-cache update \
    && go env -w GO111MODULE=on \
    && go env -w GOPROXY=https://mirrors.aliyun.com/goproxy/,direct \
    && go get  github.com/acoshift/goreload
CMD ["goreload"]
EXPOSE 9099 3000
