# ====================================================================== #
# Rich Ruby Docker Image
# A collection of ruby gems pre-installed
# ====================================================================== #


# Base image
# ---------------------------------------------------------------------- #
FROM ruby:latest


# Author
# ---------------------------------------------------------------------- #
MAINTAINER Jing Li <thyrlian@gmail.com>


# Sinatra layer
# ---------------------------------------------------------------------- #
# https://rubygems.org/gems/sinatra
# https://rubygems.org/gems/sinatra-contrib
RUN gem install sinatra sinatra-contrib


# Unicorn layer
# ---------------------------------------------------------------------- #
# https://rubygems.org/gems/unicorn
RUN gem install unicorn


# Ruby MongoDB Driver layer
# ---------------------------------------------------------------------- #
# https://rubygems.org/gems/mongo
RUN gem install mongo


ENV APP_DIR /app
RUN mkdir -p $APP_DIR
WORKDIR $APP_DIR
VOLUME $APP_DIR
