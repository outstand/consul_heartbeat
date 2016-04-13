require 'node_heartbeat/base'
require 'node_heartbeat/get_private_ip'
require 'node_heartbeat/upload_ip'

module NodeHeartbeat
  class BeatOnce < Base
    attr_accessor :bucket

    def initialize(bucket:)
      self.bucket = bucket
    end

    def call
      private_ip = GetPrivateIP.call.private_ip
      UploadIP.call(ip: private_ip, bucket: self.bucket)
    end
  end
end
