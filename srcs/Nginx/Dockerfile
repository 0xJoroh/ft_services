FROM alpine:3.11

# Update the system
RUN apk update && apk upgrade

# Installing Nginx
RUN apk add nginx

# for ssh-keygen command to generate a public/private authentication key paird
# Authentication keys allow a user to connect to a remote system without supplying a password
RUN apk add openssh

# for openssl command to create certs
RUN apk add openssl

# for service command
RUN apk add openrc

# ADD telegraf
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/
COPY ./src/telegraf.conf /etc

# to generate private keys, create CSRs, install your SSL/TLS certificate, and identify certificate information.
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;

# Add Nginx user
RUN adduser -D "admin" -G root
RUN echo "admin:admin" | chpasswd
RUN chown -R admin:root /etc/ssh

# SSH user
RUN ssh-keygen -A

# Nginx server configuration file
COPY ./src/default.conf /etc/nginx/conf.d/

COPY ./src/run.sh /tmp/
COPY ./src/liveness.sh /

RUN chmod +x /tmp/run.sh
RUN echo "<h1>Welcome to nginx!!!</h1>" > /var/www/localhost/htdocs/index.html
RUN mkdir -p /run/nginx

EXPOSE 80 443 22

# run.sh will execute once container starts
CMD	["sh", "/tmp/run.sh"]
