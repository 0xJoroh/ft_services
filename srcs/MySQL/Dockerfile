FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add mysql mysql-client openrc
COPY ./src/* /
VOLUME [ "/var/lib/mysql" ]
EXPOSE 3306

ENTRYPOINT [ "sh", "run.sh" ]
