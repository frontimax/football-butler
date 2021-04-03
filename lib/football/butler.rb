# frozen_string_literal: true
require 'httparty'
require "football/butler/version"
require "football/butler/base"
require "football/butler/configuration"
require "football/butler/tier"
require 'football/butler/api'
require 'football/butler/competitions'
require 'football/butler/matches'
require 'football/butler/areas'
require 'football/butler/teams'

module Football
  module Butler
    include Configuration
    include Tier

    class << self
      def get(path:, filters: {}, result: :default)
        Api.get(path: path, filters: filters, result: result)
      end

      def logger
        @@logger ||= defined?(Rails) && Rails.logger ? Rails.logger : Logger.new(STDOUT)
      end

      def logger=(logger)
        @@logger = logger
      end
    end
  end
end
