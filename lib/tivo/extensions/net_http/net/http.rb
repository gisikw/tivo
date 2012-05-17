require 'net/http'

module Net
  class HTTP
    def request_with_tivo(request, body = nil, &block)
      if Tivo.enabled?
        net_http = self
        protocol = net_http.use_ssl? ? 'https' : 'http'
        path = (request.path =~ /^http/ ? URI.parse(request.path).request_uri : request.path)
        full_path = "#{protocol}://#{net_http.address}:#{net_http.port}#{path}"
        raise Tivo::PendingRequestError, "Intercepted a request to #{full_path}"
      else
        request_without_tivo(request,body,&block)
      end
    end

    alias_method :request_without_tivo, :request
    alias_method :request, :request_with_tivo
  end
end
