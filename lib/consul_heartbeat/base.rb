require 'ostruct'

module ConsulHeartbeat
  class Base
    def self.call(*args)
      new(*args).call
    end

    def initialize
    end

    def call
      OpenStruct.new()
    end
  end
end
