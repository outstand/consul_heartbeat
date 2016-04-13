require 'node_heartbeat/base'

module NodeHeartbeat
  class GetPrivateIP < Base
    def call
      # http://169.254.169.254/latest/meta-data/local-ipv4
      puts 'get private ip'
      OpenStruct.new(
        private_ip: '1.2.3.4'
      )
    end
  end
end
