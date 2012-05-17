$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tivo/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tivo"
  s.version     = Tivo::VERSION
  s.authors     = ["Kevin W. Gisi"]
  s.email       = ["kevin@kevingisi.com"]
  s.homepage    = "TODO"
  s.summary     = "A convention-based web-request stubbing mechanism."
  s.description = "A convention-based web-request stubbing mechanism."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"] | Dir["spec/**/*"]

  s.add_development_dependency "rspec"
end
