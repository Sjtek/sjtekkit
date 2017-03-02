FROM node:latest
MAINTAINER Tijn Renders <tijnrenders@gmail.com>

EXPOSE 51826
WORKDIR /src

RUN cd /src && npm install -g homebridge && npm install -g homebridge-http-simple-switch
ADD config.json /root/.homebridge/

CMD ["homebridge"]
