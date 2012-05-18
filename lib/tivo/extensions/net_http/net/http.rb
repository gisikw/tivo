require 'net/http'

module Net
  class HTTP
    def request_with_tivo(request, body = nil, &block)
      if Tivo::Config.enabled?
        if Tivo::Cache.has_record?(Tivo::Utils.key_for(self,request,body))
          if Tivo::Cache.has_response?(Tivo::Utils.key_for(self,request,body))
            response = Tivo::Cache.get_response(Tivo::Utils.key_for(self,request,body))
            yield response and return response
          else
            raise Tivo::PendingRequestError, "Intercepted a request to #{Tivo::Utils.url_for(self,request)}"
          end
        else
          Tivo::Cache.queue_recording!(self,request,body)
          raise Tivo::PendingRequestError, "Intercepted a new request to #{Tivo::Utils.url_for(self,request)}"
        end
      else
        request_without_tivo(request,body,&block)
      end
    end

    alias_method :request_without_tivo, :request
    alias_method :request, :request_with_tivo
  end
end
