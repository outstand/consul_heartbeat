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
      $stdout.sync = true
      require 'node_heartbeat/run_heartbeat'
      RunHeartbeat.call(bucket: options[:bucket])
    end
  end
end
