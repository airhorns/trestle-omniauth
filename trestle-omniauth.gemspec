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
  spec.license = "LGPLv3"

  spec.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 5.0.0"
  spec.add_dependency "trestle", "~> 0.9"
  spec.add_dependency "omniauth", ">= 1.9", "< 2.1"

  spec.add_development_dependency "sqlite3"
end
