#!/bin/bash
IP1=$(getent hosts centos-lvs-nginx-a | awk '{print $1}')
IP2=$(getent hosts centos-lvs-nginx-b | awk '{print $1}')

echo "${IP1},${IP2}"
sed -r -i "s/centos-lvs-nginx-a/${IP1}/g" "/etc/keepalived/keepalived.conf"
sed -r -i "s/centos-lvs-nginx-b/${IP2}/g" "/etc/keepalived/keepalived.conf"
sed -r -i "s/nodeone/${nodeone}/g" "/etc/keepalived/keepalived.conf"
sed -r -i "s/nodetwo/${nodetwo}/g" "/etc/keepalived/keepalived.conf"
sed -r -i "s/priority_id_one/${priority_id_one}/g" "/etc/keepalived/keepalived.conf"
sed -r -i "s/priority_id_two/${priority_id_two}/g" "/etc/keepalived/keepalived.conf"

exec /usr/sbin/keepalived -f /etc/keepalived/keepalived.conf -l -n 
# nginx -c /etc/nginx/nginx.conf
# nginx -s reload
# tail -f /dev/null
