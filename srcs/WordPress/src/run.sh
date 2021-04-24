adduser -D -g 'www' www
mkdir /www
chown -R www:www /var/lib/nginx
chown -R www:www /www
mkdir /run/openrc/
touch /run/openrc/softlevel
rc-status
rc-service -v php-fpm7 start
rc-service nginx start
./telegraf-1.17.0/usr/bin/telegraf --config /telegraf-1.17.0/usr/bin/telegraf.conf &
tail -F /dev/null
