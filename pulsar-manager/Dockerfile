 FROM apachepulsar/pulsar-manager:v0.3.0
# RUN curl -H "X-XSRF-TOKEN: $CSRF_TOKEN" -H "Cookie: XSRF-TOKEN=$CSRF_TOKEN;" -H 'Content-Type: application/json' -X PUT http://127.0.0.1:7750/pulsar-manager/users/superuser -d '{"name": "admin", "password": "adminadmin", "description": "test", "email": "username@test.org"}'
  EXPOSE  9527 7750

# FROM openjdk:15-alpine
# ENV version=0.3.0
# USER root
# ADD ./entrypoint.sh /opt/pulsar-manager/entrypoint.sh
# WORKDIR /opt/pulsar-manager
# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
#   && apk --update  add  curl bash nodejs\
#   && curl -k "http://mirrors.ustc.edu.cn/apache/pulsar/pulsar-manager/pulsar-manager-${version}/apache-pulsar-manager-${version}-bin.tar.gz" | tar -zxvf - -C /opt/pulsar-manager --strip-components 1   \
#   && tar -xvf pulsar-manager.tar \
#   && rm -rf pulsar-manager.tar \
#   && cd pulsar-manager \
#   && cp -r ../dist ui\
#   && chmod a+x /opt/pulsar-manager/entrypoint.sh 
# ENTRYPOINT ["bash", "-c","/opt/pulsar-manager/entrypoint.sh"]
# #CMD [ "bash","/opt/pulsar-manager/pulsar-manager/bin/pulsar-manager" ]

# EXPOSE  9527 7750
