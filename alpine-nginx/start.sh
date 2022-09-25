#!/bin/sh
# vim:sw=4:ts=4:et

set -e
envsubst </usr/share/nginx/html/index.tmpl >/usr/share/nginx/html/index.html
nginx -c /etc/nginx/nginx.conf
nginx -s reload
# ip addr add 172.26.0.110/16 dev eth0
# ip addr add 172.26.0.220/16 dev eth0
tail -f /dev/null

