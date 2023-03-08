#!/bin/sh

if [[ -z "$ZOO_MY_ID" ]]; then
    echo 'Using default zookeeper id'
else
    echo "Using server id: ${ZOO_MY_ID}"
    echo "${ZOO_MY_ID}" > $ZOOKEEPER_DATA/myid
fi

if [[ -z "$ZOO_SERVERS" ]]; then
    echo 'Using default zoo_servers'
else
    echo "Using server list: ${ZOO_SERVERS}"
    echo -e "${ZOO_SERVERS}" >>"/opt/zookeeper/conf/zoo.cfg"
    echo -e "admin.enableServer=true" >>"/opt/zookeeper/conf/zoo.cfg"
    echo -e "4lw.commands.whitelist=*" >>"/opt/zookeeper/conf/zoo.cfg"
fi

if [[ -z "$ZOOKEEPER_DATA" ]]; then
    echo 'Using default data dir'
else
    echo "Using dataDir: ${ZOOKEEPER_DATA}"
    mkdir -p ${ZOOKEEPER_DATA}
    sed -r -i "s@^#?dataDir=.*@dataDir=$ZOOKEEPER_DATA@g" "/opt/zookeeper/conf/zoo.cfg"
    sed -r -i "s@^#?metricsProvider@metricsProvider@g" "/opt/zookeeper/conf/zoo.cfg"
fi

# Start Zookeeper
exec /opt/zookeeper/bin/zkServer.sh start-foreground

