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
# https://rubygems.org/gems/sinatra-contrib
ENV SINATRA_VERSION 1.4.7
ENV SINATRA_CONTRIB_VERSION 1.4.7
RUN gem install sinatra:$SINATRA_VERSION sinatra-contrib:$SINATRA_CONTRIB_VERSION


# Unicorn layer
# ---------------------------------------------------------------------- #
# https://rubygems.org/gems/unicorn
ENV UNICORN_VERSION 5.1.0
RUN gem install unicorn:$UNICORN_VERSION


# Ruby MongoDB Driver layer
# ---------------------------------------------------------------------- #
# https://rubygems.org/gems/mongo
ENV MONGO_DRIVER_VERSION 2.2.5
RUN gem install mongo:$MONGO_DRIVER_VERSION


# MongoDB layer
# ---------------------------------------------------------------------- #
# https://www.mongodb.org/
ENV MONGO_MAJOR 3.2
ENV MONGO_VERSION 3.2.6
ENV GOSU_VERSION 1.7
ENV GPG_KEYS \
        DFFA3DCF326E302C4787673A01C4E7FAAAB2461C \
        42F3E95A2C4F08279C4960ADD68FA50FEA312927
RUN groupadd -r mongodb && useradd -r -g mongodb mongodb
RUN apt-get update \
        && apt-get install -y --no-install-recommends \
                numactl \
        && rm -rf /var/lib/apt/lists/*
RUN set -x \
        && apt-get update && apt-get install -y --no-install-recommends ca-certificates wget && rm -rf /var/lib/apt/lists/* \
        && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)" \
        && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc" \
        && export GNUPGHOME="$(mktemp -d)" \
        && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
        && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
        && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
        && chmod +x /usr/local/bin/gosu \
        && gosu nobody true \
        && apt-get purge -y --auto-remove ca-certificates wget
RUN set -ex \
        && for key in $GPG_KEYS; do \
                apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
        done
RUN echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/$MONGO_MAJOR main" > /etc/apt/sources.list.d/mongodb-org.list
RUN set -x \
        && apt-get update \
        && apt-get install -y \
                mongodb-org=$MONGO_VERSION \
                mongodb-org-server=$MONGO_VERSION \
                mongodb-org-shell=$MONGO_VERSION \
                mongodb-org-mongos=$MONGO_VERSION \
                mongodb-org-tools=$MONGO_VERSION \
        && rm -rf /var/lib/apt/lists/* \
        && rm -rf /var/lib/mongodb \
        && mv /etc/mongod.conf /etc/mongod.conf.orig
RUN mkdir -p /data/db /data/configdb \
        && chown -R mongodb:mongodb /data/db /data/configdb
VOLUME ["/data/db", "/data/configdb"]


# Nginx layer
# ---------------------------------------------------------------------- #
# http://nginx.org/
ENV NGINX_VERSION 1.9.15-1~jessie
RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
        && echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list \
        && apt-get update \
        && apt-get install --no-install-recommends --no-install-suggests -y \
                                                ca-certificates \
                                                nginx=${NGINX_VERSION} \
                                                nginx-module-xslt \
                                                nginx-module-geoip \
                                                nginx-module-image-filter \
                                                nginx-module-perl \
                                                nginx-module-njs \
                                                gettext-base \
        && rm -rf /var/lib/apt/lists/*
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
        && ln -sf /dev/stderr /var/log/nginx/error.log
EXPOSE 80 443


ENV APP_DIR /app
RUN mkdir -p $APP_DIR
WORKDIR $APP_DIR
VOLUME $APP_DIR
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
