# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in football-butler.gemspec
gemspec

gem "rake", "~> 12.0"
gem "rspec", "~> 3.0"

# https://github.com/jnunemaker/httparty
gem 'httparty', '>= 0.15.7'

# https://github.com/codecov/codecov-ruby
gem 'codecov', require: false, group: 'test'

group :development do
  gem 'byebug', require: false
end

group :test do
  gem 'rspec-rails', '= 5.0.1'
  gem 'rubocop-rspec', '= 1.44.1'
  # https://github.com/bblimke/webmock
  gem 'webmock', '>= 3.9.3'
  gem 'byebug', require: false
  # https://github.com/simplecov-ruby/simplecov
  gem 'simplecov', '>= 0.21.2'
end