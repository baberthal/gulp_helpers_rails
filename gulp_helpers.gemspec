$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "gulp_helpers/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "gulp_helpers"
  s.version     = GulpHelpers::VERSION
  s.authors     = ["Morgan Lieberthal"]
  s.email       = ["morgan@jmorgan.org"]
  s.homepage    = "https://github.com/baberthal/rails-gulp-helpers"
  s.summary     = "Provides a set of rails view helpers if you are using gulp"
  s.description = "For users who wish to bypass the rails asset pipeline, this gem provides a set of helpers to use in views and layouts to access those assets in both production (with caching) and development environments."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.3"
end
