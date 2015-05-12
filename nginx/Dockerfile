FROM ubuntu-debootstrap:latest

RUN apt-get update && apt-get install -y curl nginx

RUN curl -L https://github.com/kelseyhightower/confd/releases/download/v0.9.0/confd-0.9.0-linux-amd64 -o /usr/bin/confd && \
    chmod a+x /usr/bin/confd && \
    mkdir -p /etc/confd/{conf.d,templates}

