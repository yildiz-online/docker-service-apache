if [ ! /etc/letsencrypt/live ]; then
  echo "Running certbot" 
  certbot --non-interactive --agree-tos --email $EMAIL --apache --domains $DOMAIN $ARGUMENT
fi
