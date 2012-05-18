namespace :tivo do
  desc "Record any missing web requests"
  task :record do
    require_relative '../tivo'
    Tivo::Cache.fetch_records!
  end
end
