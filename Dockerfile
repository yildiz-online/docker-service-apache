FROM ubuntu:focal

LABEL maintainer="Grégory Van den Borre vandenborre.gregory@hotmail.fr"

ENV EMAIL ""
ENV DOMAIN ""
ENV ARGUMENT ""

ENV TZ=Europe/Brussels

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN (apt-get update && apt-get upgrade -y -q && apt-get dist-upgrade -y -q && apt-get -y -q autoclean && apt-get -y -q autoremove)
RUN apt-get install -y -q software-properties-common curl
RUN add-apt-repository ppa:ondrej/apache2
RUN apt-get update
RUN apt-get install apache2 python-certbot-apache -y -q
COPY script.sh /
RUN chmod +x script.sh
RUN a2enmod headers
RUN a2enmod rewrite
RUN a2enmod ssl
RUN a2enmod proxy_http

EXPOSE 80
EXPOSE 443

VOLUME ["/etc/letsencrypt", "/var/www/html/", "/etc/apache2"]

ENTRYPOINT ./script.sh
