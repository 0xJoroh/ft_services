#!/bin/sh

echo -e "123456789\n123456789" | passwd root
rc-status
touch /run/openrc/softlevel
rc-service telegraf start
vsftpd /etc/vsftpd/vsftpd.conf
