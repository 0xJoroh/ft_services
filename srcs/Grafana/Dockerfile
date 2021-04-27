FROM alpine:3.11

RUN apk update
RUN apk add wget libc6-compat openrc
RUN wget https://dl.grafana.com/oss/release/grafana-7.4.0.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.4.0.linux-amd64.tar.gz

# ADD telegraf
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/
COPY ./src/telegraf.conf /etc

COPY ./src/start.sh /
COPY ./src/liveness.sh /

COPY ./src/grafana.db /grafana-7.4.0/data/grafana.db

EXPOSE 3000

CMD ["sh", "start.sh"]
