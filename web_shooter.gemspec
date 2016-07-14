# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'web_shooter/version'

Gem::Specification.new do |spec|
  spec.name          = "web_shooter"
  spec.version       = WebShooter::VERSION
  spec.authors       = ["Nick Kugaevsky"]
  spec.email         = ["nick@kugaevsky.ru"]
  spec.description   = %q{Web shooter API}
  spec.summary       = %q{Web Shooter API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler", "~> 1.3"
  spec.add_dependency "rake"
  spec.add_dependency 'thor'
  spec.add_dependency 'slim'
  spec.add_dependency 'sinatra'
  spec.add_dependency 'puma'
  spec.add_dependency 'capistrano'
  spec.add_dependency 'capistrano-rvm'
  spec.add_dependency 'capistrano-bundler'
  spec.add_dependency 'newrelic_rpm'
  spec.add_dependency 'capybara'
  spec.add_dependency 'poltergeist'
end
