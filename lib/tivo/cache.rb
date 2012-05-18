require 'yaml'

module Tivo
  class Cache
    class << self

      def records
        load_records! unless @records
        @records
      end

      def load_records!
        @records = {}
        Dir[Tivo::Config.recording_dir+'**/*.yml'].map{|r|YAML::load(File.read(r))}.select{|r|r.is_a?(Hash)}.each{|r|@records.merge!(r)}
      end
      
      def has_record?(key)
        records.has_key?(key)
      end

      def has_response?(key)
        !records[key].response.nil?
      end

      def get_response(key)
        resp = records[key].response
        resp.instance_eval <<-END
          def read_body(dest = nil, &block)
            @body
          end
        END
        resp
      end

      def queue_recording!(net_http,request,body)
        records[Tivo::Utils.key_for(net_http,request,body)] = Tivo::Request.new(net_http,request,body)
        persist_cache!
      end

      def persist_cache!
        FileUtils.mkdir_p(Tivo::Config.recording_dir)
        File.open("#{Tivo::Config.recording_dir}/tivo.yml",'w') do |f|
          f.write(records.to_yaml)
        end
      end

      def fetch_records!
        Tivo::Config.disable!
        records.each do |key,value|
          net_http = Net::HTTP.new(value.net_http.address,value.net_http.port)
          value.response = net_http.request(value.request,value.body)
        end
        Tivo::Config.enable!
        persist_cache! 
      end

    end
  end
end
