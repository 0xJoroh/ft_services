#!/bin/sh
./telegraf-1.17.0/usr/bin/telegraf --config /telegraf-1.17.0/usr/bin/telegraf.conf &
vsftpd /etc/vsftpd/vsftpd.conf
