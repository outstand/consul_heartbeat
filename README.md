# Node Heartbeat

This gem is used to publish server node IPs to an S3 bucket.  The idea is that you can enable an S3 lifecycle rule to delete keys older than a day and have this send updates at least once a day.

Example usecase: Publish consul master server nodes for cluster bootstrapping.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'node_heartbeat'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install node_heartbeat

## Usage

    $ docker run outstand/node_heartbeat start --bucket=<s3 bucket>

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

To release a new version:
- update the version number in `version.rb`
- run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org)
- run `docker build -t outstand/node_heartbeat:latest .` to build a new docker image
- run `docker push outstand/node_heartbeat:latest` to push the image to docker hub

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/outstand/node_heartbeat.

