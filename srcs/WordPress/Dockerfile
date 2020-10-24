FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add --no-cache php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN wget http://wordpress.org/latest.tar.gz
RUN tar -zxvf latest.tar.gz
RUN rm -rf latest.tar.gz
RUN mv wordpress /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress
RUN chmod 755 -R /var/www/wordpress

COPY ./wp-config.php /var/www/wordpress/wp-config.php

EXPOSE 5050
CMD ["php","-S", "0.0.0.0:5050", "-t", "/wordpress"]
