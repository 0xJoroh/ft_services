#!/bin/sh
openrc
rc-status
touch /run/openrc/softlevel
rc-service telegraf start
rc-service sshd start
nginx

while [ 1 -eq 1 ]; do
	echo llll
done
