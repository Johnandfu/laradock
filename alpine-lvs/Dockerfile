FROM alpine:latest
USER root
WORKDIR /opt
ENV lvs-nginx 1
ADD  ./keepalived.conf /etc/keepalived/keepalived.conf
ADD ./notify.sh /etc/keepalived/notify.sh
ADD ./docker-entrypoint.sh /opt/docker-entrypoint.sh
RUN  sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories  \
  && apk --update add gettext bash \
  && apk add --no-cache ipvsadm keepalived bash \
  && chmod 755 -R /etc/keepalived/notify.sh \
  && chmod a+x /opt/docker-entrypoint.sh 
EXPOSE 80

ENTRYPOINT ["/opt/docker-entrypoint.sh" ]
#CMD ["/usr/sbin/keepalived","-f","/etc/keepalived/keepalived.conf","-l","-n"]
