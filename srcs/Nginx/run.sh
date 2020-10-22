#!/bin/sh
mkdir -p /var/run/nginx

ssh-keygen -A
adduser --disabled-password admin
echo "admin:admin" | chpasswd

rc-service nginx start
touch /run/openrc/softlevel
/usr/sbin/sshd
nginx -g "daemon off;"


# rc-status, rc-service nginx start, rc-service nginx restart, apk add curl, curl 127.0.0.1
