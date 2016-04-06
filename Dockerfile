# ====================================================================== #
# MUNS (Munitions) Docker Image
# MongoDB + Unicorn + Nginx + Sinatra
# ====================================================================== #


# Base image
# ---------------------------------------------------------------------- #
FROM ruby:2.3


# Sinatra layer
# ---------------------------------------------------------------------- #
# https://rubygems.org/gems/sinatra
RUN gem install sinatra sinatra-contrib


# Unicorn layer
# ---------------------------------------------------------------------- #
# https://rubygems.org/gems/unicorn
RUN gem install unicorn
VOLUME ["/var/tmp/unicorn", "/var/log/unicorn"]


# Ruby MongoDB Driver layer
# ---------------------------------------------------------------------- #
# https://rubygems.org/gems/mongo
RUN gem install mongo


# MongoDB layer
# ---------------------------------------------------------------------- #
# https://www.mongodb.org/
RUN \
  curl -O https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-3.2.4.tgz && \
  tar -zxvf mongodb-linux-x86_64-3.2.4.tgz && \
  rm mongodb-linux-x86_64-3.2.4.tgz && \
  mv mongodb-linux-x86_64-3.2.4 mongodb
VOLUME ["/data/db"]
ENV PATH $PATH:/mongodb/bin


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


