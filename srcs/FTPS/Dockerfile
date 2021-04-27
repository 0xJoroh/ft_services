FROM alpine:3.11

RUN apk update
RUN apk upgrade && apk add openrc openssl vsftpd libc6-compat

RUN mkdir -p /etc/ssl/private
RUN mkdir -p /etc/ssl/certs

RUN adduser -D admin -G root && echo "admin:admin" | chpasswd
RUN chown -R admin:root /etc/vsftpd
RUN yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt
COPY ./src/vsftpd.conf /etc/vsftpd/vsftpd.conf

# ADD telegraf
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/
COPY ./src/telegraf.conf /etc

COPY ./src/start.sh /
COPY ./src/liveness.sh /

RUN chmod 777 /start.sh

#Open port 20 for ftp data to and from, port 21 for ftp commands
#and ports 20000 to 20001 to be used in passive mode
EXPOSE 20 21 20000 20001

CMD ["sh", "start.sh"]
