require 'node_heartbeat/base'

module NodeHeartbeat
  class UploadIP < Base
    attr_accessor :ip, :bucket

    def initialize(ip:, bucket:)
      self.ip = ip
      self.bucket = bucket
    end

    def call
      puts "upload ip #{self.ip} to bucket #{self.bucket}"
    end
  end
end
