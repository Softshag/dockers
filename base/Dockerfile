FROM ubuntu-debootstrap:latest

RUN mkdir /workspace && \
    apt-get update && \
    apt-get install -y ca-certificates

COPY runtime /usr/bin

ENV NODESTER_ROOT=/nodester

ENV PATH=/nodester/current/bin:$PATH





