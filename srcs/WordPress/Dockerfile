FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add wget php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session mysql-client
RUN apk add nginx openrc
# add nginx & php to Runlevel default to make nginx and php-fpm7 starts when the system reboots:
# RUN rc-update add nginx default
# RUN rc-update add php-fpm7 default
COPY ./src/default.conf /etc/nginx/conf.d/
COPY ./src/wordpress /var/www/localhost/htdocs/wordpress
COPY ./src/wordpress.sql /tmp/
COPY ./src/run.sh /tmp/
EXPOSE 5050
CMD ["sh", "/tmp/run.sh"]
