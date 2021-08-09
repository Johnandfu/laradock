FROM v2fly/v2fly-core
LABEL maintainer="Teddysun <i@teddysun.com>"
COPY config_client.json /etc/v2ray/config.json
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories 
# ADD https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geoip.dat   /usr/local/share/v2ray/geoip.dat
# ADD https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geosite.dat /usr/local/share/v2ray/geosite.dat
COPY geoip.dat /usr/local/share/v2ray/geoip.dat
COPY geosite.dat /usr/local/share/v2ray/geosite.dat
ENV TZ=Asia/Shanghai
EXPOSE  1080 8080 1081
