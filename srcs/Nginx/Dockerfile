FROM alpine:latest

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
# RUN apk add openrc

# move Nginx server configuration file
COPY ./default.conf /etc/nginx/conf.d/
# move run.sh scripte
COPY ./run.sh /tmp/

# make run.sh file executable
RUN chmod +x /tmp/run.sh
# to generate private keys, create CSRs, install your SSL/TLS certificate, and identify certificate information.
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;

RUN mkdir -p /run/nginx

EXPOSE 80 443 22

# run.sh will execute once container starts
# CMD	["sh", "/tmp/run.sh"]
CMD	["nginx", "-g", "daemon off;"]
