# frozen_string_literal: true

require_relative 'lib/football/butler/version'

Gem::Specification.new do |spec|
  spec.name          = "football-butler"
  spec.version       = Football::Butler::VERSION
  spec.authors       = ["Jörg Kirschstein"]
  spec.email         = ["info@joerg-kirschstein.de"]

  spec.summary       = 'Football data via API'
  spec.description   = 'Multiple API Wrapper with endpoint classes for football-data.org & apifootball.com'
  spec.homepage      = "https://github.com/frontimax/football-butler"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://rubygems.org/gems/football_butler"

  spec.files = Dir["lib/**/*", "LICENSE"].reject { |f| File.directory?(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'byebug', '~> 11.1'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_dependency 'httparty', '~> 0.15'
end
