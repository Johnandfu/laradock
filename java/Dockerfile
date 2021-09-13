FROM  alpine:latest
LABEL maintainer="Mahmoud Zalt <mahmoud@zalt.me>"
WORKDIR /home/www/spring-mall
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories  \ 
  && echo "https://mirrors.tuna.tsinghua.edu.cn/alpine/edge/main" /etc/apk/repositories \
  && echo "https://mirrors.tuna.tsinghua.edu.cn/alpine/edge/community " /etc/apk/repositories \
  && echo "https://mirrors.tuna.tsinghua.edu.cn/alpine/edge/testing" /etc/apk/repositories \
  && apk --no-cache update \
  && apk add openjdk11-jdk \
  && apk add maven
#CMD ["mvn","spring-boot:run" ]   
EXPOSE 8011
