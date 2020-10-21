FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add wget php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar -zxvf /phpMyAdmin-5.0.4-all-languages.tar.gz
RUN rm -f /phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mv /phpMyAdmin-5.0.4-all-languages /etc/phpmyadmin


RUN chown -R www-data:www-data /etc/phpmyadmin

EXPOSE 5000
