FROM alpine:3.11

RUN apk update

RUN apk add influxdb openrc libc6-compat

# ADD telegraf
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/
COPY ./src/telegraf.conf /etc

RUN mkdir /run/openrc
COPY ./src/start.sh /
# COPY ./src/liveness.sh /

RUN chmod +x start.sh


EXPOSE 8086

CMD ["sh", "start.sh"]
