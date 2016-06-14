FROM outstand/ruby-base:2.3.1-alpine
MAINTAINER Ryan Schlesinger <ryan@outstand.com>

RUN addgroup heartbeat && \
    adduser -S -G heartbeat heartbeat

RUN apk --no-cache add build-base openssh

ENV USE_BUNDLE_EXEC true

WORKDIR /node_heartbeat
COPY Gemfile node_heartbeat.gemspec /node_heartbeat/
COPY lib/node_heartbeat/version.rb /node_heartbeat/lib/node_heartbeat/
COPY scripts/fetch-bundler-data.sh /node_heartbeat/scripts/fetch-bundler-data.sh

ARG bundler_data_host
RUN /node_heartbeat/scripts/fetch-bundler-data.sh ${bundler_data_host} && \
    bundle install && \
    git config --global push.default simple
COPY . /node_heartbeat/
RUN ln -s /node_heartbeat/exe/node_heartbeat /usr/local/bin/node_heartbeat

COPY scripts/docker-entrypoint.sh /docker-entrypoint.sh

ENV DUMB_INIT_SETSID 0
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["help"]
