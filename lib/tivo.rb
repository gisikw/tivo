module Tivo
  @enabled = true

  class << self
    def enabled?
      @enabled
    end

    def enable!
      @enabled = true
    end

    def disable!
      @enabled = false
    end
  end
end

require_relative 'tivo/pending_request_error'
require_relative 'tivo/hooks'

require_relative 'tivo/extensions/test_unit'
require_relative 'tivo/extensions/net_http'
require_relative 'tivo/extensions/rspec'
