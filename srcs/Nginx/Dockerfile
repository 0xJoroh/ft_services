FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add nginx openssh openssl

COPY ./default.conf /etc/nginx/conf.d/
COPY ./run.sh /tmp/

RUN chmod +x /tmp/run.sh
RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/nginx-selfsigned.crt -keyout /etc/ssl/private/nginx-selfsigned.key -subj "/C=RU/ST=Moscow/L=Moscow/O=SCHOOL21/CN=www.ccaptain.com"

EXPOSE 80 443 22

CMD ["sh", "/tmp/run.sh"]
