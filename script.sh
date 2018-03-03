if [ ! /etc/letsencrypt ]; then
  certbot --non-interactive --agree-tos --email $EMAIL --apache --domains $DOMAIN $ARGUMENT
fi
