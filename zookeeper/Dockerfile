FROM zookeeper:latest

LABEL maintainer="Hyduan <hyduan96@qq.com>"

VOLUME /data
VOLUME /datalog

EXPOSE 2181
ADD zkServer.sh /apache-zookeeper-3.7.0-bin/bin/zkServer.sh
RUN chmod 777  /apache-zookeeper-3.7.0-bin/bin/zkServer.sh

CMD ["zkServer.sh", "start-foreground"]
