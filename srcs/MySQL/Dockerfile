FROM alpine:3.11

RUN apk update && apk upgrade
RUN apk add mysql mysql-client openrc

# ADD telegraf
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/
COPY ./src/telegraf.conf /etc

COPY ./src/* /
COPY ./src/mariadb-server.cnf etc/my.cnf.d/
VOLUME [ "/var/lib/mysql" ]
EXPOSE 3306

ENTRYPOINT [ "sh", "run.sh" ]
