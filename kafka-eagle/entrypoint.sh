#!/bin/bash -x
chmod +x /opt/kafka-eagle/bin/ke.sh

/opt/kafka-eagle/bin/ke.sh start
tail -f /dev/null
