#!/bin/bash
java -jar -Dspring.profiles.active=env /home/www/mall-swarm/mall-admin/mall-admin-1.0-SNAPSHOT.jar
java -jar -Dspring.profiles.active=env /home/www/mall-swarm/mall-auth/mall-auth-1.0-SNAPSHOT.jar
java -jar -Dspring.profiles.active=env /home/www/mall-swarm/mall-common/mall-common-1.0-SNAPSHOT.jar
java -jar -Dspring.profiles.active=env /home/www/mall-swarm/mall-demo/mall-demo-1.0-SNAPSHOT.jar
java -jar -Dspring.profiles.active=env /home/www/mall-swarm/mall-gateway/mall-gateway-1.0-SNAPSHOT.jar
java -jar -Dspring.profiles.active=env /home/www/mall-swarm/mall-mbg/mall-mbg-1.0-SNAPSHOT.jar
java -jar -Dspring.profiles.active=env /home/www/mall-swarm/mall-monitor/mall-monitor-1.0-SNAPSHOT.jar
java -jar -Dspring.profiles.active=env /home/www/mall-swarm/mall-portal/mall-portal-1.0-SNAPSHOT.jar
java -jar -Dspring.profiles.active=env /home/www/mall-swarm/mall-search/mall-search-1.0-SNAPSHOT.jar
