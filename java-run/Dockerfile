FROM  alpine:latest
WORKDIR /home/www/mall-swarm
ADD ./startup.sh /opt/startup.sh
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories  \ 
  && chmod a+x 755 /opt/startup.sh \
  && apk add openjdk11-jdk bash \
  && apk add maven \
  && sed -i 's/\r//g' /opt/startup.sh
CMD ["/bin/bash", "/opt/startup.sh"]
EXPOSE  9091
