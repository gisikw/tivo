module Tivo
  class Request < Struct.new(:net_http,:request,:body,:response)
  end
end
