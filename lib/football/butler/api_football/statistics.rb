# frozen_string_literal: true
require 'football/butler/api_football/base_api_football'

module Football
  module Butler
    module ApiFootball
      class Statistics < BaseApiFootball
        PATH = 'fixtures/statistics'

        class << self
          ## STATISTICS
          #
          # fixtures/statistics&fixture={id}
          def by_match(id:, result:)
            filters = { fixture: id }
            Api.get(path: PATH, filters: filters, result: result)
          end
        end
      end
    end
  end
end
