rc-status
touch /run/openrc/softlevel
rc-service telegraf start
cd /grafana-7.4.0/bin
./grafana-server
tail -f dev/null
