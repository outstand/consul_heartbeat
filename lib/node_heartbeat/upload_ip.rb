require 'node_heartbeat/base'
require 'fog/aws'

module NodeHeartbeat
  class UploadIP < Base
    attr_accessor :ip, :bucket

    def initialize(ip:, bucket:)
      self.ip = ip
      self.bucket = bucket
    end

    def call
      puts "Uploading ip #{self.ip} to bucket #{self.bucket}"
      storage = Fog::Storage.new provider: 'AWS'
      bucket = storage.directories.get(self.bucket)
      bucket.files.create(
        key: self.ip
      )
    end
  end
end
