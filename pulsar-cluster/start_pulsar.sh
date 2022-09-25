#!/usr/bin/env bash

if [[ -z "${advertisedaddress}" ]]; then
  echo 'Using default advertisedAddress'
else
  echo "Using listeners: ${advertisedaddress}"
  sed -r -i "s@^#?advertisedAddress=.*@advertisedAddress=${advertisedaddress}@g" "/opt/pulsar/conf/bookkeeper.conf"
  sed -r -i "s@^#?advertisedAddress=.*@advertisedAddress=${advertisedaddress}@g" "/opt/pulsar/conf/broker.conf"
fi

if [[ -z "${zkservers}" ]]; then
  echo 'Using default zkservers'
else
  echo "Using zkServers: ${zkservers}"
  sed -r -i "s@^#?zkServers=.*@zkServers=${zkservers}@g" "/opt/pulsar/conf/bookkeeper.conf"
  sed -r -i "s@^#?zookeeperServers=.*@zookeeperServers=${zkservers}@g" "/opt/pulsar/conf/broker.conf"
  sed -r -i "s@^#?globalZookeeperServers=.*@globalZookeeperServers=${zkservers}@g" "/opt/pulsar/conf/broker.conf"
fi

if [[ -z "${journalDirectory}" ]]; then
  echo 'Using default journalDirectory'
else
  echo "Using journalDirectory: ${journalDirectory}"
  mkdir -pv ${journalDirectory}

  sed -r -i "s@^#?journalDirectory=.*@journalDirectory=${journalDirectory}@g" "/opt/pulsar/conf/bookkeeper.conf"
fi
if [[ -z "${ledgerDirectories}" ]]; then
  echo 'Using default ledgerDirectories'
else
  echo "Using ledgerDirectory: ${ledgerDirectories}"
  mkdir -pv ${ledgerDirectories}
  sed -r -i "s@^#?ledgerDirectories=.*@ledgerDirectories=${ledgerDirectories}@g" "/opt/pulsar/conf/bookkeeper.conf"
fi
if [[ -z "${prometheusstatshttpport}" ]]; then
  echo 'Using default prometheusstatshttpport'
else
  echo "Using prometheusstatshttpport: ${prometheusstatshttpport}"
  sed -r -i "s@^#?prometheusStatsHttpPort=.*@prometheusStatsHttpPort=${prometheusstatshttpport}@g" "/opt/pulsar/conf/bookkeeper.conf"
fi

if [[ -z "${clusterName}" ]]; then
  echo 'Using default clusterName'
else
  echo "Using inter broker listener name: ${clusterName}"
  sed -r -i "s@^#?clusterName=.*@clusterName=${clusterName}@g" "/opt/pulsar/conf/broker.conf"
fi

if [[ -z "${ZOO_SERVERS}" ]]; then
  echo 'Using default zoo_servers'
else
  echo "Using server list: ${ZOO_SERVERS}"
  echo -e "${ZOO_SERVERS}" >>"/opt/pulsar/conf/zookeeper.conf"
fi

if [[ -z "${zookeeperDataDir}" ]]; then
  echo 'Using default data dir'
else
  echo "Using dataDir: ${zookeeperDataDir}"
  mkdir -p ${zookeeperDataDir}
  sed -r -i "s@^#?dataDir=.*@dataDir=${zookeeperDataDir}@g" "/opt/pulsar/conf/zookeeper.conf"
fi
if [[ -z "$ZOO_SERVERS_ID" ]]; then
  echo 'Using default zookeeper id'
else
  echo "Using server id: ${ZOO_SERVERS_ID}"
  echo "${ZOO_SERVERS_ID}" >${zookeeperDataDir}/myid
fi

#/opt/pulsar/bin/pulsar-daemon start zookeeper
if [[ -z "${init_cluster}" ]]; then
  echo 'Using default clusterName'
else
  echo "cluster init : "
  echo Y | /opt/pulsar/bin/bookkeeper shell metaformat

  /opt/pulsar/bin/pulsar initialize-cluster-metadata \
    -c ${clusterName} \
    -md zk1:2181 \
    --zookeeper zk1:2181 \
    --global-zookeeper zk1:2181 \
    -cms zk1:2181 \
    -uw http://pulsar-cluster1:8080,pulsar-cluster2:8080,pulsar-cluster-3:8080 \
    -tw https://pulsar-cluster1:8443,pulsar-cluster2:8443,pulsar-cluster-3:8443 \
    -ub pulsar://pulsar-cluster1:6650,pulsar-cluster2:6650,pulsar-cluster3:6650 \
    -tb pulsar+ssl://pulsar-cluster1:6651,pulsar-cluster2:6651,pulsar-cluster3:6651

fi

/opt/pulsar/bin/bookkeeper bookie
/opt/pulsar/bin/pulsar broker
