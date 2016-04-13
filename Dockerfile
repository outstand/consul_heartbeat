FROM outstand/ruby-base:2.2.4-alpine
MAINTAINER Ryan Schlesinger <ryan@outstand.com>

RUN addgroup heartbeat && \
    adduser -S -G heartbeat heartbeat

# Use this to install an official release
RUN apk --no-cache add libxml2 libxslt \
    && apk --no-cache add --virtual build-dependencies build-base libxml2-dev libxslt-dev \
    && gem install nokogiri -- --use-system-libraries \
    && gem install node_heartbeat \
    && apk del build-dependencies

# Use this to install a development version
# RUN apk --no-cache add build-base libxml2-dev libxslt-dev
# COPY . /node_heartbeat/
# RUN cd /node_heartbeat \
#     && bundle config build.nokogiri --use-system-libraries \
#     && bundle install \
#     && bundle exec rake install

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENV DUMB_INIT_SETSID 0
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD []
