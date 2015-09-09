# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'refile/mongoid/version'

Gem::Specification.new do |spec|
  spec.name          = "refile-mongoid"
  spec.version       = Refile::Mongoid::VERSION
  spec.authors       = ["Dima Samodurov"]
  spec.email         = ["dimasamodurov@gmail.com"]
  spec.summary       = %q{MongoID integration to Refile}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "refile", "~> 0.5"
  spec.add_runtime_dependency "mongoid", ">= 4.0"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_development_dependency "webmock", "~> 1.20"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"
end
