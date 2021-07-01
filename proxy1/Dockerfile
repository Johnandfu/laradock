FROM alpine

EXPOSE 8118

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk --no-cache --update add privoxy ca-certificates && \
    sed -i'' 's/127\.0\.0\.1:8118/0\.0\.0\.0:8118/' /etc/privoxy/config && \
    echo 'forward-socks5 / ssr:1080 .' >> /etc/privoxy/config
RUN chown privoxy:privoxy /etc/privoxy/*
ENTRYPOINT ["privoxy"]
CMD ["--no-daemon","--user","privoxy","/etc/privoxy/config"]

