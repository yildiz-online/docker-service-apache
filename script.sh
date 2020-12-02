#!/bin/bash
echo "Starting apache web server" 
rm -f /var/run/apache2/apache2.pid
service apache2 start

if [ ! /etc/letsencrypt/live ]; then
  echo "Running certbot to retrieve certificates" 
  certbot --non-interactive --agree-tos --email $EMAIL --apache --domains $DOMAIN $ARGUMENT
fi
echo "Apache web server started and certificates retrieved"

tail -f /var/log/apache2/error.log

