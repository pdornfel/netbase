# coding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'netbase/version'

Gem::Specification.new do |spec|

  spec.name        = 'netbase'

  spec.version     = "0.0.0"
  spec.version     = Netbase::VERSION
  spec.platform    = Gem::Platform::RUBY

  spec.date        = '2020-12-07'
  spec.summary     = "A ruby wrapper for this tool from Netbase Quid"
  spec.description = "Netbase Insight Explorer API. It provides simple methods to handle authorization and to execute HTTP calls."
  spec.authors     = ["Paul Dornfeld"]
  spec.email       = 'pdornfel@gmail.com'

  spec.files        = Dir.glob("lib/**/*") + %w(LICENSE.md README.md)
  spec.require_path = 'lib'

  spec.executables << 'netbase'
  spec.homepage    = 'https://rubygems.org/gems/netbase'
  spec.license     = 'MIT'

  spec.add_dependency('httparty', '~> 0.18')
  spec.add_dependency('hashie', '~> 4.0')

  spec.add_development_dependency('bundler', '~> 2')
  spec.add_development_dependency("rspec", '~> 3.10')
  spec.add_development_dependency("rspec-nc", '~> 0.3')
  spec.add_development_dependency("pry", '~> 0.13')
end
