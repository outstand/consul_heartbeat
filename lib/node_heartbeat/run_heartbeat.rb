require 'node_heartbeat/base'
require 'node_heartbeat/beat_once'

module NodeHeartbeat
  class RunHeartbeat < Base
    attr_accessor :bucket

    SLEEP_TIME = 60 * 60 # 1 hour
    ERROR_SLEEP_TIME = 5

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
        loop do
          timeout = SLEEP_TIME
          begin
            BeatOnce.call(bucket: self.bucket)
          rescue => e
            puts "Warning: #{e.message}"
            timeout = ERROR_SLEEP_TIME
          end
          sleep timeout
        end
      rescue Interrupt
        puts 'Exiting'
      end
    end
  end
end
