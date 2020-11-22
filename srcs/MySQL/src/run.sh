# mysql_install_db --user=mysql --datadir=/var/lib/mysql
# mkdir /run/openrc/
# touch /run/openrc/softlevel
# rc-service mariadb start
# mysql --user root --password=root < /tmp/wordpress.sql
# rc-service mariadb restart

# Init DB
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "CREATE USER 'root'@'%' IDENTIFIED BY 'root';" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'%' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
echo "DROP DATABASE test" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
mysql wordpress -u root --password=  < /tmp/wordpress.sql


tail -F /dev/null
