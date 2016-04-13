require 'thor'

module ConsulHeartbeat
  class CLI < Thor
    desc 'version', 'Print out the version string'
    def version
      say ConsulHeartbeat::VERSION.to_s
    end

    desc 'start', 'Start the heartbeat'
    option :bucket, aliases: '-b', required: true, type: :string, banner: '<s3_bucket>'
    def start
      require 'consul_heartbeat/start_heartbeat'
      StartHeartbeat.call(bucket: options[:bucket])
    end
  end
end
