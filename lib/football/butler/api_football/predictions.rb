# frozen_string_literal: true
require 'football/butler/api_football/base_api_football'

module Football
  module Butler
    module ApiFootball
      class Predictions < BaseApiFootball
        PATH = :predictions

        class << self
          ## PREDICTIONS
          #
          # fixture
          # required
          # integer
          # The id of the fixture
          #
          # predictions&fixture={id}
          def by_match(id:, filters:, result:)
            filters.merge!(fixture: id)
            Api.get(path: PATH, filters: filters, result: result)
          end
        end
      end
    end
  end
end
