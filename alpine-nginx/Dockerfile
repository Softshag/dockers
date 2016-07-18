FROM nginx:1.11.0-alpine



VOLUME ["/etc/confd"]


COPY runtime /usr/bin

EXPOSE 80 443

#CMD ["nginx", "-g", "daemon off;"]

#ENTRYPOINT  ["/usr/bin/entrypoint.sh"]

CMD ["/usr/bin/entrypoint.sh"]