require 'node_heartbeat/base'
require 'node_heartbeat/beat_once'

module NodeHeartbeat
  class StartHeartbeat < Base
    attr_accessor :bucket

    SLEEP_TIME = 60 * 60 # 1 hour

    def initialize(bucket:)
      self.bucket = bucket
    end

    def call
      %w(INT TERM).each do |sig|
        begin
          trap sig do
            raise Interrupt
          end
        rescue ArgumentError
          puts "Signal #{sig} not supported"
        end
      end

      begin
        while true
          BeatOnce.call(bucket: self.bucket)
          sleep SLEEP_TIME
        end
      rescue Interrupt
        puts 'Exiting'
      end
    end
  end
end
