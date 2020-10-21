FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add wget php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl

RUN wget http://wordpress.org/latest.tar.gz
RUN tar -zxvf latest.tar.gz
RUN rm -f latest.tar.gz
RUN mv wordpress /etc/
RUN chown -R www-data:www-data /etc/wordpress
RUN chmod 755 -R /etc/wordpress

COPY ./wp-config-sample.php /etc/wordpress

EXPOSE 5050
