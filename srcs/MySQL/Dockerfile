FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add mysql mysql-client openrc


COPY ./src/wordpress.sql /tmp/
COPY ./src/run.sh /tmp/

VOLUME [ "/var/lib/mysql" ]
EXPOSE 3306

CMD [ "sh", "/tmp/run.sh" ]
