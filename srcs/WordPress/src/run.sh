# mysql --host=mysql-service --user=root --password=root wordpress < /tmp/wordpress.sql
echo "CREATE DATABASE wordpress;" | mysql -u root --password=root
php-fpm7
nginx -g "daemon off;"
