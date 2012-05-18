require 'digest/md5'
require 'fileutils'

module Tivo
  module Utils
    extend self

    def key_for(net_http,request,body)
      Digest::MD5.hexdigest(url_for(net_http,request)+body.to_s)
    end

    def url_for(net_http,request)
      protocol = net_http.use_ssl? ? 'https' : 'http'
      path = (request.path =~ /^http/ ? URI.parse(request.path).request_uri : request.path)
      "#{protocol}://#{net_http.address}:#{net_http.port}#{path}"
    end

  end
end
