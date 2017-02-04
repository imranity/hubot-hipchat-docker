FROM node:7.5-slim
MAINTAINER hayderimran7@gmail.com

USER root

RUN apt-get update && apt-get install  -y git vim curl net-tools redis-server \
supervisor python
RUN npm install -g yo generator-hubot
RUN mkdir -p /var/log/hubot /var/log/redis

USER node
WORKDIR /home/node
RUN yo hubot --owner Hubot --name Hubot --adapter hipchat --description "A bot for hipchat"
COPY supervisor-hubot.conf /etc/supervisor/conf.d/
USER root
ENTRYPOINT ["supervisord","-n"]
