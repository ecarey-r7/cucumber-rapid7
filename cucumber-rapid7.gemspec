# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cucumber/rapid7/version'

Gem::Specification.new do |spec|
  spec.name          = 'cucumber-rapid7'
  spec.version       = Cucumber::Rapid7::VERSION
  spec.authors       = ['Erran Carey']
  spec.email         = ['erran_carey@rapid7.com']
  spec.description   = %q{Cucumber extensions used at Rapid7}
  spec.summary       = %q{Cucumber extensions for Rapid7}
  spec.homepage      = 'https://github.com/ecarey-r7/cucumber-rapid7'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
