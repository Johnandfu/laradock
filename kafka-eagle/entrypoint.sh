#!/bin/bash -x
sed -i "s/ZKSERVER/${ZKSERVER}/g" /opt/kafka-eagle/conf/system-config.properties
chmod +x /opt/kafka-eagle/bin/ke.sh

sh /opt/kafka-eagle/bin/ke.sh start
