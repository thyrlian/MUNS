#!/bin/bash

# Clone your project repository
git clone https://$GITHUB_USERNAME:$GITHUB_PASSWORD@github.com/$GITHUB_REPO $APP_DIR

# Create directories and files for unicorn socket / pid / logs
mkdir -p /var/tmp/unicorn
mkdir -p /var/log/unicorn
touch /var/log/unicorn/unicorn.stdout.log
touch /var/log/unicorn/unicorn.stderr.log

# Launch unicorn
unicorn -c $UNICORN_CONFIG -E $RACK_ENV -D

# This script never ends :)
while true; do sleep 3600; done
