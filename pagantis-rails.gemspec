# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pagantis-rails/version'

Gem::Specification.new do |spec|
  spec.name          = "pagantis-rails"
  spec.version       = Pagantis::Rails::VERSION
  spec.authors       = ["David Gil"]
  spec.email         = ["dgilperez@gmail.com"]
  spec.description   = %q{Rails wrapper for pagantis-ruby library.}
  spec.summary       = %q{Pagantis API On Rails}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
