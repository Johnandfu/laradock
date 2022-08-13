#!/usr/bin/env bash

if [[ -z "$KAFKA_LISTENERS" ]]; then
  echo 'Using default listeners'
else
  echo "Using listeners: ${KAFKA_LISTENERS}"
  sed -r -i "s@^#?listeners=.*@listeners=$KAFKA_LISTENERS@g" "/opt/kafka/config/server.properties"
fi

if [[ -z "$KAFKA_ADVERTISED_LISTENERS" ]]; then
  echo 'Using default advertised listeners'
else
  echo "Using advertised listeners: ${KAFKA_ADVERTISED_LISTENERS}"
  sed -r -i "s@^#?advertised.listeners=.*@advertised.listeners=$KAFKA_ADVERTISED_LISTENERS@g" "/opt/kafka/config/server.properties"
fi

if [[ -z "$KAFKA_LISTENER_SECURITY_PROTOCOL_MAP" ]]; then
  echo 'Using default listener security protocol map'
else
  echo "Using listener security protocol map: ${KAFKA_LISTENER_SECURITY_PROTOCOL_MAP}"
  sed -r -i "s@^#?listener.security.protocol.map=.*@listener.security.protocol.map=$KAFKA_LISTENER_SECURITY_PROTOCOL_MAP@g" "/opt/kafka/config/server.properties"
fi

if [[ -z "$KAFKA_INTER_BROKER_LISTENER_NAME" ]]; then
  echo 'Using default inter broker listener name'
else
  echo "Using inter broker listener name: ${KAFKA_INTER_BROKER_LISTENER_NAME}"
  sed -r -i "s@^#?inter.broker.listener.name=.*@inter.broker.listener.name=$KAFKA_INTER_BROKER_LISTENER_NAME@g" "/opt/kafka/config/server.properties"
fi
if [[ -z "$KAFKA_DATA_DIRS" ]]; then
  echo 'Using default inter broker listener name'
else
  echo "Using data dir: ${KAFKA_DATA_DIRS}"
  mkdir -p ${KAFKA_DATA_DIRS}
  sed -r -i "s@^#?log.dirs=.*@log.dirs=$KAFKA_DATA_DIRS@g" "/opt/kafka/config/server.properties"
fi
sed -r -i "s@^#?broker.id=.*@broker.id=$KAFKA_BROKER_ID@g" "/opt/kafka/config/server.properties"
sed -r -i "s@^#?zookeeper.connect=.*@zookeeper.connect=$ZOOKEEPER_CONNECT@g" "/opt/kafka/config/server.properties"

uuid=$(/opt/kafka/bin/kafka-storage.sh random-uuid)
#/opt/kafka/bin/kafka-storage.sh format -t $uuid -c /opt/kafka/config/server.properties
/opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties
