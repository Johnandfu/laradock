FROM alpine:3.12

# roughly, https://git.alpinelinux.org/aports/tree/main/haproxy/haproxy.pre-install?h=3.12-stable

# see https://sources.debian.net/src/haproxy/jessie/debian/rules/ for some helpful navigation of the possible "make" arguments
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories  \ 
    &&  set -x \
	&& apk add --no-cache --virtual .build-deps \
		gcc \
        haproxy\
        keepalived

COPY docker-entrypoint.sh /usr/local/bin/
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 80 9200
CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]