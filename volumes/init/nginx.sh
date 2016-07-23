#!/bin/bash

# Wait for project's Nginx configuration file
while ! [ -e $NGINX_CONFIG ]; do
  echo 'Waiting for Nginx configuration file...'
  sleep 1
done
echo 'Found Nginx configuration file.'

# Create directories and files for Nginx pid / logs
mkdir -p /var/tmp/nginx
mkdir -p /var/log/nginx
touch /var/log/nginx/nginx.access.log
touch /var/log/nginx/nginx.error.log

# Start Nginx with specified configuration file
nginx -c $NGINX_CONFIG

# This script never ends :)
while true; do sleep 3600; done
