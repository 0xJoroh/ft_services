#!/bin/sh
openrc
rc-status
touch /run/openrc/softlevel
rc-service telegraf start
rc-service sshd start
nginx
sh
