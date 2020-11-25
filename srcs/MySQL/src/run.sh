mysql_install_db --user=mysql --datadir=/var/lib/mysql
mkdir /run/openrc/
touch /run/openrc/softlevel
rc-status
rc-service mariadb start

mysqladmin -u root password 'admin'
mysql -u root -e "CREATE DATABASE wordpress;"
mysql -u root -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"
mysql wordpress -u root < wordpress.sql

rc-service mariadb restart
tail -F /dev/null
