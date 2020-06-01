FROM alpine

COPY ./wordpress.zip .

RUN apt-get update && apt-get upgrade
RUN apt-get install -y unzip
RUN unzip wordpress.zip
RUN rm wordpress

EXPOSE 5050
