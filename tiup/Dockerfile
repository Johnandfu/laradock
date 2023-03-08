FROM alpine:latest
WORKDIR /var/tiup
USER root
COPY  ./topology.yaml /var/tiup/topology.yaml
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories  \ 
  && apk add --no-cache openssh-server openssh curl  bash sudo && \
  sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config && \
  sed -i "s/#Port.*/Port 22/g" /etc/ssh/sshd_config && \
  sed -i "s/#PubkeyAuthentication.*/PubkeyAuthentication yes/g" /etc/ssh/sshd_config && \
  ssh-keygen -t dsa -P "" -f /etc/ssh/ssh_host_dsa_key && \
  ssh-keygen -t rsa -P "" -f /etc/ssh/ssh_host_rsa_key && \
  ssh-keygen -t ecdsa -P "" -f /etc/ssh/ssh_host_ecdsa_key && \
  ssh-keygen -t ed25519 -P "" -f /etc/ssh/ssh_host_ed25519_key && \
  echo  "root:root" | chpasswd && \
  curl --proto '=https' --tlsv1.2 -sSf https://tiup-mirrors.pingcap.com/install.sh | sh && \ 
  ln -s /root/.tiup/bin/tiup /bin/tiup
  # tiup cluster && \
  # tiup update --self && tiup update cluster &&\
  # tiup cluster check ./topology.yaml --user root -p root -y && \
  # tiup cluster deploy tidb-test1 v5.4.0 ./topology.yaml --user root -p root -y && \
  # tiup cluster start tidb-test1
EXPOSE 22 4000 9090  9100 9115 2379 2380 10080 20180 20160 3000 9093 9094
CMD ["/usr/sbin/sshd","-D"]
