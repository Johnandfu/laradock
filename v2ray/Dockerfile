FROM v2fly/v2fly-core
LABEL maintainer="Teddysun <i@teddysun.com>"
COPY config_client.json /etc/v2ray/config.json
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories 
ADD https://download.fastgit.org/Loyalsoldier/v2ray-rules-dat/releases/download/202108122209/geoip.dat  /usr/local/share/v2ray/geoip.data 
ADD https://download.fastgit.org/Loyalsoldier/v2ray-rules-dat/releases/download/202108122209/geosite.dat /usr/local/share/v2ray/geosite.dat
ENV TZ=Asia/Shanghai
EXPOSE  1080 8080 1081
