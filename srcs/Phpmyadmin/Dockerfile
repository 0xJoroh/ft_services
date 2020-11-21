FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add nginx phpmyadmin php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

# RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
# RUN tar -zxvf /phpMyAdmin-5.0.4-all-languages.tar.gz
# RUN rm -f /phpMyAdmin-5.0.4-all-languages.tar.gz
# RUN mv /phpMyAdmin-5.0.4-all-languages /etc/phpmyadmin

# RUN chown -R www-data:www-data /etc/phpmyadmin
COPY config.inc.php /etc/phpmyadmin/config.inc.php

EXPOSE 5000
CMD ["php","-S", "0.0.0.0:5000", "-t", "/usr/share/webapps/phpmyadmin"]
