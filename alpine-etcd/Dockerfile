FROM alpine:latest

COPY runtime /usr/bin

EXPOSE 4001 7001 

VOLUME ["/data"]

ENTRYPOINT ["sh","/usr/bin/entrypoint.sh"]

CMD ["-data-dir=/data"]