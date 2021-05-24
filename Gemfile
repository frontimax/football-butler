# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in football-butler.gemspec
gemspec

# May 2021: vulnerability Alert Github:
gem "nokogiri", ">= 1.11.4"
gem "actionpack", ">= 6.1.3.2"

group :test do
  gem 'rspec-rails', '= 5.0.1'
  gem 'rubocop-rspec', '= 1.44.1'
  # https://github.com/bblimke/webmock
  gem 'webmock', '>= 3.9.3'
  # https://github.com/simplecov-ruby/simplecov
  gem 'simplecov', '>= 0.21.2'
  gem 'codecov', require: false
end