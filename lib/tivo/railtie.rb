require 'tivo'
require 'rails'

module Tivo
  class Railtie < Rails::Railtie
    railtie_name :tivo

    rake_tasks do
      load 'tasks/tivo_tasks.rake'
    end
  end
end
