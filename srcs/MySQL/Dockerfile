FROM alpine:3.11

RUN apk update && apk upgrade
RUN apk add mysql mysql-client openrc

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz
RUN tar -zxvf telegraf-1.17.0_linux_amd64.tar.gz
COPY ./src/telegraf.conf telegraf-1.17.0/usr/bin/

COPY ./src/* /
COPY ./src/mariadb-server.cnf etc/my.cnf.d/
VOLUME [ "/var/lib/mysql" ]
EXPOSE 3306

ENTRYPOINT [ "sh", "run.sh" ]
