FROM python:alpine

ENV SERVER_ADDR     0.0.0.0
ENV SERVER_PORT     8399
ENV PASSWORD        shapixiaolaodi
ENV METHOD          aes-256-cfb
ENV PROTOCOL        plain
ENV PROTOCOLPARAM   32
ENV OBFS            origin
ENV TIMEOUT         300
ENV DNS_ADDR        8.8.8.8
ENV DNS_ADDR_2      8.8.4.4
ENV BIND_ADDR       0.0.0.0
ENV BIND_PORT       1080
ENV SSR_SERVER_ADDR 0.0.0.0
ENV SSR_SERVER_PORT 443



ARG BRANCH=manyuser
ARG WORK=/home


RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk --no-cache add py-pip libsodium curl wget


RUN mkdir -p $WORK && \
    wget -qO- --no-check-certificate https://github.com/huangsen365/shadowsocksr/archive/$BRANCH.tar.gz | tar -xzf - -C $WORK


WORKDIR $WORK/shadowsocksr-$BRANCH/shadowsocks


EXPOSE 1080
CMD python local.py -b $BIND_ADDR -l $BIND_PORT -s $SSR_SERVER_ADDR -p $SSR_SERVER_PORT -k $PASSWORD -m $METHOD -o $OBFS -O $PROTOCOL -G $PROTOCOLPARAM
