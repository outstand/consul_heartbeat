require 'consul_heartbeat/base'
require 'consul_heartbeat/get_private_ip'
require 'consul_heartbeat/upload_ip'

module ConsulHeartbeat
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
