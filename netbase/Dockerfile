FROM  node:lts-alpine3.12
LABEL maintainer="Mahmoud Zalt <mahmoud@zalt.me>"
ADD  ./docker.js  /var/docker.js
WORKDIR /var/www/NeteaseCloudMusicApi
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories  \ 
  && apk --no-cache update \
  && apk add  npm\
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /var/lib/apt/lists/* \
  && chmod a+x /var/docker.js \
  && rm /var/cache/apk/*  \
  && cd  /var/www/NeteaseCloudMusicApi 

#ENTRYPOINT ["composer", "config -g repo.packagist composer https://mirrors.aliyun.com/composer/"]
CMD ["node","app.js"]

EXPOSE 3003
