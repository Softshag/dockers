FROM softshag/base:latest

RUN apt-get update && apt-get install -y git-core

ENV IOJS_VERSION=io@2.0.1

RUN nodester u -f $IOJS_VERSION


VOLUME ["/workspace"]

WORKDIR /workspace

COPY runtime /usr/bin

RUN chmod a+x /usr/bin/entrypoint.sh && \
    chmod a+x /usr/bin/git-as.sh && \
    chmod a+x /usr/bin/ssh-as.sh && \
    chmod a+x /usr/bin/run_app

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/usr/bin/entrypoint.sh"]


