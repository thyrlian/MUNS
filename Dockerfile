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
RUN gem install sinatra


# Unicorn layer
# ---------------------------------------------------------------------- #
# https://rubygems.org/gems/unicorn
RUN gem install unicorn


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
ENV PATH $PATH:/mongodb/bin


# Nginx layer
# ---------------------------------------------------------------------- #
# http://nginx.org/


