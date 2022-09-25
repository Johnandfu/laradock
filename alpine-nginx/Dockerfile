FROM  nginx:alpine
USER root
ENV lvs-nginx 1
ADD  ./start.sh /opt/start.sh
ADD  ./index.tmpl /usr/share/nginx/html/index.tmpl
#ADD  ./default.conf  /etc/nginx/conf.d/default.conf
WORKDIR /opt
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories  \
  && apk --update add gettext bash ipvsadm \
  && chmod a+x /opt/start.sh
ENTRYPOINT ["/opt/start.sh"]
EXPOSE 80
