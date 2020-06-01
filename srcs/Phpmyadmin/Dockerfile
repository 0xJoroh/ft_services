FROM alpine

COPY ./phpMyAdmin.zip .

RUN apt-get update && apt-get upgrade
RUN apt-get install -y unzip
RUN unzip phpMyAdmin.zip
RUN rm phpMyAdmin
