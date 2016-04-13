require 'node_heartbeat/base'
require 'excon'

module NodeHeartbeat
  class GetPrivateIP < Base
    URL = 'http://169.254.169.254/latest/meta-data/local-ipv4'.freeze

    def call
      response = Excon.get(URL)
      raise "Non-200 status #{response.status} from #{url}" if response.status != 200
      OpenStruct.new(
        private_ip: response.body
      )
    end
  end
end
