FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add --no-cache mysql mysql-client
COPY setup.sh /tmp/setup.sh

EXPOSE 3306

CMD ["sh", "/tmp/install.sh"]
