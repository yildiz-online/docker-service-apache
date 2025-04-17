FROM httpd:2.4.63

LABEL maintainer="Grégory Van den Borre vandenborre.gregory@hotmail.fr"

ENV EMAIL=""
ENV DOMAIN=""
ENV ARGUMENT=""

ENV="TZ=Europe/Brussels"

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install certbot python3-certbot-apache -y -q
COPY script.sh /script.sh
RUN chmod +x script.sh
RUN a2enmod headers
RUN a2enmod rewrite
RUN a2enmod ssl
RUN a2enmod proxy_http
RUN a2enmod http2

EXPOSE 80
EXPOSE 443

VOLUME ["/etc/letsencrypt", "/var/www/html/", "/etc/apache2"]

ENTRYPOINT ./script.sh
