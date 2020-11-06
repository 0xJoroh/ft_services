# FROM alpine:latest

# RUN apk update && apk upgrade
# RUN apk add wget php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session mysql-client

# RUN apk add nginx openrc
# add nginx & php to Runlevel default to make nginx and php-fpm7 starts when the system reboots:
# RUN rc-update add nginx default
# RUN rc-update add php-fpm7 default
# COPY ./src/default.conf /etc/nginx/conf.d/

# RUN wget https://wordpress.org/latest.tar.gz && tar -zxvf latest.tar.gz && rm -rf latest.tar.gz && mv wordpress /var/www/localhost/htdocs/wordpress

# COPY ./src/wp-config.php /var/www/localhost/htdocs/wordpress/wp-config.php

# EXPOSE 5050
# CMD ["php","-S", "0.0.0.0:5050", "-t", "/var/www/localhost/htdocs/wordpress"]

FROM alpine:latest

RUN apk update
RUN apk add wget php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session mysql-client

RUN wget https://wordpress.org/latest.tar.gz && tar -xvf latest.tar.gz && rm -f latest.tar.gz && mv wordpress /etc/

COPY ./src/wp-config.php /etc/wordpress/
COPY ./src/wordpress.sql /tmp/
COPY ./src/run.sh /tmp/

EXPOSE 5050
CMD ["sh", "/tmp/run.sh"]
