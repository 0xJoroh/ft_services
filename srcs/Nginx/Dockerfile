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

# to generate private keys, create CSRs, install your SSL/TLS certificate, and identify certificate information.
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;

# Add nginxx user
# RUN adduser -D "user"
# RUN echo "user:root" | chpasswd
# RUN chown -R user /var/lib/nginx

# # SSH user
# RUN ssh-keygen -A
# RUN adduser -D "userSSH"
# RUN echo "userSSH:root" | chpasswd

# Nginx server configuration file
COPY ./src/default.conf /etc/nginx/conf.d/

COPY ./src/run.sh /tmp/
# COPY ./src/index.html /var/www/localhost/htdocs
RUN echo "<h1>Welcome to nginx!!!</h1>" > /var/www/localhost/htdocs/index.html

# ADD telegraf
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/
COPY ./src/telegraf.conf /etc

# make run.sh file executable
# RUN chmod +x /tmp/run.sh

RUN mkdir -p /run/nginx

EXPOSE 80 443 22

# run.sh will execute once container starts
CMD	["sh", "/tmp/run.sh"]
# CMD	["nginx", "-g", "daemon off;"]
