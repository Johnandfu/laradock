ARG MYSQL_VERSION
FROM mysql:latest

LABEL maintainer="Mahmoud Zalt <mahmoud@zalt.me>"
RUN echo 'deb http://repo.mysql.com/apt/debian/ buster mysql-tools' >> /etc/apt/sources.list.d/mysql.list \
    && sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list \ 
    && apt-get update \
    && apt-get install -y lsb-release wget sudo \
    # && wget -O /tmp/mysql-apt-all.deb https://repo.mysql.com//mysql-apt-config_0.8.16-1_all.deb \
    # && dpkg -i /tmp/mysql-apt-all.deb \
    && apt-get update \
    && echo 4 | apt-get install -y mysql-shell mysql-router \
    && rm -rf /tmp/*

#####################################
# Set Timezone
#####################################

ARG TZ=UTC
ENV TZ ${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && chown -R mysql:root /var/lib/mysql/

COPY my.cnf /etc/mysql/conf.d/my.cnf
COPY init_cluster.js  ./init_cluster.js
COPY config_local_instance.js  ./config_local_instance.js
COPY docker-entrypoint.sh  ./docker-entrypoint.sh

RUN chmod 0444 /etc/mysql/conf.d/my.cnf
ENTRYPOINT ["./docker-entrypoint.sh" ]
CMD [ "mysqld" ]


EXPOSE 3306
