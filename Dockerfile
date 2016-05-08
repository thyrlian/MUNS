# ====================================================================== #
# MUNS (Munitions) Docker Image
# MongoDB + Unicorn + Nginx + Sinatra
# ====================================================================== #


# Base image
# ---------------------------------------------------------------------- #
FROM ruby:2.3


# Author
# ---------------------------------------------------------------------- #
MAINTAINER Jing Li <thyrlian@gmail.com>


# Sinatra layer
# ---------------------------------------------------------------------- #
# https://rubygems.org/gems/sinatra
RUN gem install sinatra sinatra-contrib
VOLUME ["/var/log/sinatra"]


# Unicorn layer
# ---------------------------------------------------------------------- #
# https://rubygems.org/gems/unicorn
RUN gem install unicorn
VOLUME ["/var/log/unicorn"]


# Ruby MongoDB Driver layer
# ---------------------------------------------------------------------- #
# https://rubygems.org/gems/mongo
RUN gem install mongo


# MongoDB layer
# ---------------------------------------------------------------------- #
# https://www.mongodb.org/
RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927 && \
  echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.2 main" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list && \
  apt-get update && \
  apt-get install -y mongodb-org
VOLUME ["/data/db", "/var/log/mongodb"]


# Nginx layer
# ---------------------------------------------------------------------- #
# http://nginx.org/
RUN \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]
EXPOSE 80
EXPOSE 443


ENV APP_DIR /app
RUN mkdir -p $APP_DIR
WORKDIR $APP_DIR
VOLUME $APP_DIR
