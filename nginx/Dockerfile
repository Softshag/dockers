FROM nginx:1.9

RUN apt-get update && apt-get install -y git-core curl

RUN curl -L https://github.com/kelseyhightower/confd/releases/download/v0.9.0/confd-0.9.0-linux-amd64 -o /usr/bin/confd && \
    chmod a+x /usr/bin/confd && \
    mkdir -p /etc/confd/{conf.d,templates}

RUN rm /etc/nginx/conf.d/default.conf

VOLUME ["/etc/confd"]

COPY entrypoint.sh /usr/bin/entrypoint.sh

RUN chmod a+x /usr/bin/entrypoint.sh


CMD ["/usr/bin/entrypoint.sh"]