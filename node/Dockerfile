FROM softshag/base:latest

VOLUME ["/workspace"]

WORKDIR /workspace

COPY runtime /usr/bin

RUN chmod a+x /usr/bin/entrypoint.sh && \
    chmod a+x /usr/bin/git-as.sh && \
    chmod a+x /usr/bin/ssh-as.sh && \
    chmod a+x /usr/bin/run_app

ENV IOJS_VERSION=io@2.0.1

RUN nodester u -f $IOJS_VERSION

ENTRYPOINT ["/usr/bin/entrypoint.sh"]


