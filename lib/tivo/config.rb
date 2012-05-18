module Tivo
  module Config
    extend self

    @enabled = true
    @recording_dir = File.expand_path(File.dirname(__FILE__)+'/../../recordings/')

    def enabled?
      @enabled
    end

    def enable!
      @enabled = true
    end

    def disable!
      @enabled = false
    end

    def recording_dir
      @recording_dir
    end

  end
end
