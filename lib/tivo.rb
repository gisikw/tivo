module Tivo
end

require_relative 'tivo/config'

require_relative 'tivo/pending_request_error'
require_relative 'tivo/request'
require_relative 'tivo/cache'
require_relative 'tivo/utils'
require_relative 'tivo/hooks'

require_relative 'tivo/extensions/test_unit'
require_relative 'tivo/extensions/net_http'
require_relative 'tivo/extensions/rspec'

if defined?(Rails)
  require_relative 'tivo/railtie'
end
