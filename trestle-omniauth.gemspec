$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "trestle/omniauth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name = "trestle-omniauth"
  spec.version = Trestle::Omniauth::VERSION
  spec.authors = ["Harry Brundage"]
  spec.email = ["harry.brundage@gmail.com"]
  spec.homepage = "https://github.com/airhorns/trestle-omniauth"
  spec.description = "Use omniauth auth providers to authenticate with Trestle"
  spec.summary = "Use omniauth auth providers to authenticate with Trestle"
  spec.license = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.0.beta3"
  spec.add_dependency "trestle", "~> 0.8"
  spec.add_dependency "omniauth", "~> 1.9.0"

  spec.add_development_dependency "sqlite3"
end
