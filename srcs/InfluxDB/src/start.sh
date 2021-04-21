#!/bin/sh
rc-status
touch /run/openrc/softlevel
influxd 
# ./telegraf-1.17.0/usr/bin/telegraf --config /telegraf-1.17.0/usr/bin/telegraf.conf
