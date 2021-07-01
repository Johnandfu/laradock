FROM python:rc-alpine
LABEL maintainer="kmdgeek"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
 && apk --no-cache add ffmpeg git \
 && python -m pip install --upgrade pip \
 && pip3 install --no-cache-dir --upgrade git+https://github.com/soimort/you-get@develop \
 && apk del git \
 && mkdir -p /download
WORKDIR /download
