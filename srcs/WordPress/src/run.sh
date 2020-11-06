mysql --host=mysql-service --user=root --password=root wordpress < /tmp/wordpress.sql
php -S 0.0.0.0:5050 -t /etc/wordpress/
