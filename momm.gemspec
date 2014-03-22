# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'momm/version'

Gem::Specification.new do |spec|
  spec.name          = "momm"
  spec.version       = Momm::VERSION
  spec.authors       = ["Jingkai He"]
  spec.email         = ["jaxihe@gmail.com"]
  spec.summary       = %q{A Currency Exchange Calculator}
  spec.description   = %q{A Currency Exchange Calculator}
  spec.homepage      = "https://github.com:jaxi/momm"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "redis", ">= 3.0.6"
  spec.add_dependency "redis-namespace", ">= 1.3.2"
  spec.add_dependency "dalli", ">= 2.7.0"
  spec.add_dependency "httparty", ">= 0.12.0"
  spec.add_dependency "json"

  spec.add_development_dependency "rake"
  spec.add_development_dependency "sinatra"
  spec.add_development_dependency "rspec"
end
