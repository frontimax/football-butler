# frozen_string_literal: true
require 'simplecov'
SimpleCov.start 'rails'

ENV["RAILS_ENV"] = 'test'

if ENV['CI'] == 'true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

require 'rubygems'
require "bundler/setup"
require "football/butler"
require "byebug"
require "rails"
require "active_support/all"

require 'httparty'
require 'webmock/rspec'
include WebMock #  WebMock::API

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each) do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end
end

def get_mocked_response(file, value_if_file_not_found = false)
  File.read(File.join(File.dirname(__FILE__), 'mocked_responses/', file))
rescue Errno::ENOENT => e
  raise e if value_if_file_not_found == false
  value_if_file_not_found
end
