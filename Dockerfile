FROM node:latest
MAINTAINER Tijn Renders <tijnrenders@gmail.com>

EXPOSE 51826
WORKDIR /src

RUN apt-get update \
    && apt-get install -y libnss-mdns avahi-discover libavahi-compat-libdnssd-dev libkrb5-dev avahi-daemon libnss-mdns

ADD avahi-daemon.conf /etc/avahi/avahi-daemon.conf
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh && mkdir -p /var/run/dbus

RUN cd /src && \
    npm install -g homebridge --unsafe-perm && \
    npm install -g homebridge-http-simple-switch --unsafe-perm && \
    npm install -g homebridge-better-http-rgb --unsafe-perm
ADD config.json /root/.homebridge/

ENTRYPOINT ["/entrypoint.sh"]
