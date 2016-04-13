FROM outstand/ruby-base:2.2.4-alpine
MAINTAINER Ryan Schlesinger <ryan@outstand.com>

RUN addgroup heartbeat && \
    adduser -S -G heartbeat heartbeat

# Use this to install an official release
RUN gem install node_heartbeat

# Use this to install a development version
# COPY . /node_heartbeat/
# RUN cd /node_heartbeat \
#     && bundle install \
#     && bundle exec rake install

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENV DUMB_INIT_SETSID 0
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD []
