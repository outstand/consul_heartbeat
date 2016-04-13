FROM outstand/ruby-base:2.2.4-alpine
MAINTAINER Ryan Schlesinger <ryan@outstand.com>

RUN addgroup heartbeat && \
    adduser -S -G heartbeat heartbeat

RUN gem install node_heartbeat
COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD []
