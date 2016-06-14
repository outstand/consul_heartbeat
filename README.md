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

    $ docker run outstand/node_heartbeat start -b <s3 heartbeat bucket>

## Development

- `./build_dev.sh`
- `docker run -it --rm --net=host -v $(pwd):/node_heartbeat outstand/node_heartbeat:dev start -b bucket -n backup`

To release a new version:
- Update the version number in `version.rb` and `Dockerfile.release` and commit the result.
- `./build_dev.sh`
- `docker run -it --rm -v ~/.gitconfig:/root/.gitconfig -v ~/.gitconfig.user:/root/.gitconfig.user -v ~/.ssh/id_rsa:/root/.ssh/id_rsa -v ~/.gem:/root/.gem outstand/node_heartbeat:dev rake release`
- `docker build -t outstand/node_heartbeat:VERSION -f Dockerfile.release .`
- `docker push outstand/node_heartbeat:VERSION`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/outstand/node_heartbeat.

