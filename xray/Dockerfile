FROM teddysun/xray:latest
LABEL maintainer="Teddysun <i@teddysun.com>"
ADD config_client_tls.json /etc/xray/config.json
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories 
ADD https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geoip.dat  /usr/local/share/xray/geoip.dat
ADD https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geosite.dat /usr/local/share/xray/geosite.dat
ENV TZ=Asia/Shanghai
EXPOSE  1080 1081 8080
