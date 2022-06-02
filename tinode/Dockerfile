FROM alpine:latest
WORKDIR /var/tiup
USER root
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories  \ 
  && apk add --no-cache openssh-server openssh curl  bash sudo dnsmasq && \
  sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config && \
  sed -i "s/#Port.*/Port 22/g" /etc/ssh/sshd_config && \
  sed -i "s/#PubkeyAuthentication.*/PubkeyAuthentication yes/g" /etc/ssh/sshd_config && \
  ssh-keygen -t dsa -P "" -f /etc/ssh/ssh_host_dsa_key && \
  ssh-keygen -t rsa -P "" -f /etc/ssh/ssh_host_rsa_key && \
  ssh-keygen -t ecdsa -P "" -f /etc/ssh/ssh_host_ecdsa_key && \
  ssh-keygen -t ed25519 -P "" -f /etc/ssh/ssh_host_ed25519_key && \
  echo  "root:root" | chpasswd 
EXPOSE 22 4000 9090  9100 9115 2379 2380 10080 20180 20160 3000 9093 9094
CMD ["/usr/sbin/sshd","-D"]
