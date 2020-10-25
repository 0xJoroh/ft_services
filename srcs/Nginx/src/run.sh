#!/bin/sh

openrc
touch /run/openrc/softlevel

sshd
nginx -g "daemon off;"
