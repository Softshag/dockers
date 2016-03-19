FROM mhart/alpine-node:4

RUN apk add --update bash

ADD runtime /usr/bin

RUN chmod a+x /usr/bin/entrypoint.sh && \
    chmod a+x /usr/bin/git-as.sh && \
    chmod a+x /usr/bin/ssh-as.sh && \
    chmod a+x /usr/bin/run_app && \
    rm -rf var/cache/apk/*

ENV WORKSPACE=/workspace

VOLUME ["/workspace"]

WORKDIR /workspace

ENTRYPOINT ["/usr/bin/entrypoint.sh"]