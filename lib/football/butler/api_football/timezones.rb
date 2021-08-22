# frozen_string_literal: true
require 'football/butler/api_football/base_api_football'

module Football
  module Butler
    module ApiFootball
      class Timezones < BaseApiFootball
        PATH = :timezone

        class << self
          ## TIMEZONE
          #
          # /timezone
          def all(result:)
            Api.get(path: PATH, result: result)
          end
        end
      end
    end
  end
end
