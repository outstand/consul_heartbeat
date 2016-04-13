# Consul Heartbeat

This gem is used to publish consul master server node IPs to an S3 bucket.  The idea is that you can enable an S3 lifecycle rule to delete keys older than a day and have this send updates at least once a day.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'consul_heartbeat'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install consul_heartbeat

## Usage

    $ docker run outstand/consul_heartbeat start --bucket=<s3 bucket>

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/outstand/consul_heartbeat.

