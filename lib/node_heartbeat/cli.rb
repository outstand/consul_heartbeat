require 'thor'

module NodeHeartbeat
  class CLI < Thor
    desc 'version', 'Print out the version string'
    def version
      say NodeHeartbeat::VERSION.to_s
    end

    desc 'start', 'Start the heartbeat'
    option :bucket, aliases: '-b', required: true, type: :string, banner: '<s3_bucket>'
    def start
      require 'node_heartbeat/start_heartbeat'
      StartHeartbeat.call(bucket: options[:bucket])
    end
  end
end
