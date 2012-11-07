$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "knowledge/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "knowledge"
  s.version     = Knowledge::VERSION
  s.authors     = ["Jeff Ma"]
  s.email       = ["mjf429@163.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Knowledge."
  s.description = "TODO: Description of Knowledge."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "jquery-rails"
  s.add_dependency "grit"
  s.add_dependency "stringex"
  s.add_dependency "slim"
  s.add_dependency "kaminari"
  s.add_dependency "github-markdown"
  s.add_dependency "bootstrap-sass"
end
